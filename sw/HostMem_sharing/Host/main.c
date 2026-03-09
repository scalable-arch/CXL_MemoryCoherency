#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <inttypes.h>
#include <stdatomic.h>
#include <unistd.h>   // usleep
#include <errno.h>    // ETIMEDOUT

#include "dma.lib.h"

// ============================================================
// Host (runs first) <-> HPS (runs later) Shared-Memory test
//
// Flow (swapped roles):
//   Host:
//     1) Allocate shared buffer at fixed IOVA 0x0100_0000
//     2) Wait DEVICE/HPS REQ == token
//     3) Write ACK = token
//     4) Wait GO == token
//     5) Host increment N times
//     6) Wait DONE == token (HPS finished)
//     7) Clear DONE, print final counter
//
// Shared memory layout (within 2MB window):
//   counter @ +0x0000_0000 (word0)
//   handshake base @ +0x0010_0000:
//     REQ  @ +0x0
//     ACK  @ +0x4
//     GO   @ +0x8
//     DONE @ +0xC
// ============================================================

// ---- Shared memory IOVA/size ----
#define SHARED_IOVA_BASE   (0x01000000ull)                 // required: IOVA=0x1000000
#define SHARED_BYTES       (2ull * 1024ull * 1024ull)      // 2MB (includes HS_BASE offset 1MB)

// ---- For debug printing: HPS address = H2F_BASE + IOVA ----
#define HPS_H2F_BASE       (0x80000000ull)

// ---- Offsets inside shared buffer ----
#define COUNTER_OFF        (0x00000000u)
#define HS_BASE_OFF        (0x00100000u)

#define HS_REQ_OFF         (HS_BASE_OFF + 0x0u)
#define HS_ACK_OFF         (HS_BASE_OFF + 0x4u)
#define HS_GO_OFF          (HS_BASE_OFF + 0x8u)
#define HS_DONE_OFF        (HS_BASE_OFF + 0xCu)

// ---- Behavior params ----
#define HOST_INC_COUNT     (5000u)

static inline void host_fence(void)
{
    // compiler + CPU ordering barrier
    atomic_thread_fence(memory_order_seq_cst);
}

static inline volatile uint32_t *shm_u32_ptr(uint8_t *base, uint32_t off)
{
    return (volatile uint32_t *)(void *)(base + off);
}

static int wait_u32_eq(volatile uint32_t *p,
                       uint32_t expected,
                       uint32_t poll_limit,
                       uint32_t poll_sleep_us)
{
    // poll_limit == 0  => wait forever
    for (uint32_t i = 0; (poll_limit == 0u) || (i < poll_limit); ++i) {
        if (*p == expected) {
            host_fence();
            return 0;
        }
        if (poll_sleep_us) usleep(poll_sleep_us);
    }
    return -ETIMEDOUT;
}

// Host waits for device/HPS REQ, then acks, then waits for GO.
static int host_wait_req_ack_wait_go(uint8_t *shared_va,
                                     uint32_t token,
                                     uint32_t poll_limit,
                                     uint32_t poll_sleep_us)
{
    volatile uint32_t * const req  = shm_u32_ptr(shared_va, HS_REQ_OFF);
    volatile uint32_t * const ack  = shm_u32_ptr(shared_va, HS_ACK_OFF);
    volatile uint32_t * const go   = shm_u32_ptr(shared_va, HS_GO_OFF);
    volatile uint32_t * const done = shm_u32_ptr(shared_va, HS_DONE_OFF);

    // Host-side init (safe even if already zero)
    *ack  = 0u;
    *go   = 0u;
    *done = 0u;
    host_fence();

    // (1) Wait REQ == token (device sends)
    int st = wait_u32_eq(req, token, poll_limit, poll_sleep_us);
    if (st) return st;

    // (2) ACK = token
    *ack = token;
    host_fence();

    // (3) Wait GO == token (device sends after it resets counter)
    st = wait_u32_eq(go, token, poll_limit, poll_sleep_us);
    if (st) return st;

    return 0;
}

static int host_increment_n_times_shared(uint8_t *shared_va, uint32_t n)
{
    volatile uint32_t * const counter = shm_u32_ptr(shared_va, COUNTER_OFF);

    for (uint32_t i = 0; i < n; ++i) {
        // atomicity ignored for now (per request)
        (*counter)++;
    }
    host_fence();
    return 0;
}

static int host_wait_done_and_clear(uint8_t *shared_va,
                                    uint32_t token,
                                    uint32_t poll_limit,
                                    uint32_t poll_sleep_us)
{
    volatile uint32_t * const done = shm_u32_ptr(shared_va, HS_DONE_OFF);

    int st = wait_u32_eq(done, token, poll_limit, poll_sleep_us);
    if (st) return st;

    // Clear DONE so next run can reuse the same location
    *done = 0u;
    host_fence();
    return 0;
}

// IMPORTANT: dma.lib.h's cleanup() frees shared_mem after close_dev (bad order),
// so we use a safe cleanup that frees mem first.
static void cleanup_all(dma_ctx_t *ctx)
{
    if (!ctx) return;

    if (ctx->rx_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, (uint32_t)ctx->rx_memid);
        ctx->rx_memid = -1;
    }
    if (ctx->tx_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, (uint32_t)ctx->tx_memid);
        ctx->tx_memid = -1;
    }
    if (ctx->desc_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, (uint32_t)ctx->desc_memid);
        ctx->desc_memid = -1;
    }
    if (ctx->shared_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, (uint32_t)ctx->shared_memid);
        ctx->shared_memid = -1;
    }

    bwvfio_close_dev(&ctx->dev);
}

int main(int argc, char **argv)
{
    const char *bdf = (argc >= 2) ? argv[1] : "0000:41:00.0";

    dma_ctx_t ctx = (dma_ctx_t){0};
    ctx.desc_memid   = -1;
    ctx.tx_memid     = -1;
    ctx.rx_memid     = -1;
    ctx.shared_memid = -1;

    int st = init_vfio(&ctx, bdf);
    if (st) {
        printf("init_vfio failed: %d\n", st);
        return 1;
    }

    // 1) Allocate shared buffer at fixed IOVA
    st = alloc_shared_buffer(&ctx, (size_t)SHARED_BYTES, SHARED_IOVA_BASE);
    if (st) {
        printf("alloc_shared_buffer failed: %d\n", st);
        cleanup_all(&ctx);
        return 1;
    }

    // Initialize shared contents
    memset(ctx.shared_va, 0, ctx.shared_bytes);
    host_fence();

    printf("[shared] VA   = %p\n", (void *)ctx.shared_va);
    printf("[shared] IOVA = 0x%016" PRIx64 " (requested 0x%016" PRIx64 ")\n",
           ctx.shared_iova, (uint64_t)SHARED_IOVA_BASE);
    printf("[shared] size = 0x%zx bytes\n", ctx.shared_bytes);

    // Debug: what HPS should use
    const uint64_t hps_target_addr = HPS_H2F_BASE + ctx.shared_iova + COUNTER_OFF;
    const uint64_t hps_hs_base     = HPS_H2F_BASE + ctx.shared_iova + HS_BASE_OFF;
    printf("[HPS] TARGET_ADDR should be 0x%016" PRIx64 "\n", hps_target_addr);
    printf("[HPS] HS_BASE     should be 0x%016" PRIx64 "\n", hps_hs_base);

    const uint32_t token = 0xA5A50001u;

    printf("\nHOST is ready. Waiting for DEVICE REQ(token=0x%08x)...\n", token);
    printf("(Run device/HPS program now)\n\n");

    // poll_limit=0 => wait forever
    st = host_wait_req_ack_wait_go(ctx.shared_va, token,
                                   /*poll_limit=*/0u,
                                   /*poll_sleep_us=*/1000u);
    if (st) {
        printf("handshake(wait-req/ack/wait-go) failed: %d\n", st);
        cleanup_all(&ctx);
        return 2;
    }

    printf("Handshake OK (GO seen). Start HOST increment: %u times\n", HOST_INC_COUNT);

    st = host_increment_n_times_shared(ctx.shared_va, HOST_INC_COUNT);
    if (st) {
        printf("host increment failed: %d\n", st);
        cleanup_all(&ctx);
        return 3;
    }

    printf("HOST increment done. Waiting DEVICE DONE(token)...\n");

    st = host_wait_done_and_clear(ctx.shared_va, token,
                                  /*poll_limit=*/0u,
                                  /*poll_sleep_us=*/1000u);
    if (st) {
        printf("wait DONE failed: %d\n", st);
        cleanup_all(&ctx);
        return 4;
    }

    volatile uint32_t * const counter = shm_u32_ptr(ctx.shared_va, COUNTER_OFF);
    uint32_t final = *counter;
    host_fence();

    printf("DONE seen+cleared. FINAL counter = 0x%08x (%u)\n", final, final);

    // Optional: clear handshake regs for next run
    *shm_u32_ptr(ctx.shared_va, HS_REQ_OFF) = 0u;
    *shm_u32_ptr(ctx.shared_va, HS_ACK_OFF) = 0u;
    *shm_u32_ptr(ctx.shared_va, HS_GO_OFF)  = 0u;
    host_fence();

    cleanup_all(&ctx);
    return 0;
}