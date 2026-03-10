#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <inttypes.h>
#include <stdatomic.h>
#include <unistd.h>   // usleep, getopt
#include <errno.h>    // ETIMEDOUT
#include <stdlib.h>   // strtoul

#include "dma.lib.h"

// ---- Shared memory IOVA/size ----
#define SHARED_IOVA_BASE   (0x01000000ull)
#define SHARED_BYTES       (2ull * 1024ull * 1024ull)

// ---- For debug printing: HPS address = H2F_BASE + IOVA ----
#define HPS_H2F_BASE       (0x80000000ull)

// ---- Offsets inside shared buffer ----
#define COUNTER_OFF        (0x00000000u)
#define HS_BASE_OFF        (0x00100000u)

#define HS_REQ_OFF         (HS_BASE_OFF + 0x00u)
#define HS_ACK_OFF         (HS_BASE_OFF + 0x04u)
#define HS_GO_OFF          (HS_BASE_OFF + 0x08u)
#define HS_DONE_OFF        (HS_BASE_OFF + 0x0Cu)

// Peterson lock vars
#define LOCK_HOST_OFF      (HS_BASE_OFF + 0x20u)
#define LOCK_DEV_OFF       (HS_BASE_OFF + 0x40u)
#define TURN_OFF           (HS_BASE_OFF + 0x60u)

#define TURN_HOST          (0u)
#define TURN_DEV           (1u)

// ---- Behavior params ----
#define DEFAULT_HOST_INC_COUNT  (50000u)

static inline void host_fence(void)
{
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
    for (uint32_t i = 0; (poll_limit == 0u) || (i < poll_limit); ++i) {
        if (*p == expected) {
            host_fence();
            return 0;
        }
        if (poll_sleep_us) usleep(poll_sleep_us);
    }
    return -ETIMEDOUT;
}

static void host_prepare_shared_state(uint8_t *shared_va)
{
    *shm_u32_ptr(shared_va, COUNTER_OFF)   = 0u;

    *shm_u32_ptr(shared_va, HS_REQ_OFF)    = 0u;
    *shm_u32_ptr(shared_va, HS_ACK_OFF)    = 0u;
    *shm_u32_ptr(shared_va, HS_GO_OFF)     = 0u;
    *shm_u32_ptr(shared_va, HS_DONE_OFF)   = 0u;

    *shm_u32_ptr(shared_va, LOCK_HOST_OFF) = 0u;
    *shm_u32_ptr(shared_va, LOCK_DEV_OFF)  = 0u;
    *shm_u32_ptr(shared_va, TURN_OFF)      = TURN_HOST;

    host_fence();
}

// Host waits for device/HPS REQ, then ACKs, then waits for GO.
static int host_wait_req_ack_wait_go(uint8_t *shared_va,
                                     uint32_t token,
                                     uint32_t poll_limit,
                                     uint32_t poll_sleep_us)
{
    volatile uint32_t * const req = shm_u32_ptr(shared_va, HS_REQ_OFF);
    volatile uint32_t * const ack = shm_u32_ptr(shared_va, HS_ACK_OFF);
    volatile uint32_t * const go  = shm_u32_ptr(shared_va, HS_GO_OFF);

    int st = wait_u32_eq(req, token, poll_limit, poll_sleep_us);
    if (st) return st;

    *ack = token;
    host_fence();

    st = wait_u32_eq(go, token, poll_limit, poll_sleep_us);
    if (st) return st;

    return 0;
}

// Peterson mutex: host side
static inline void peterson_lock_host(uint8_t *shared_va)
{
    volatile uint32_t * const flag_self  = shm_u32_ptr(shared_va, LOCK_HOST_OFF);
    volatile uint32_t * const flag_other = shm_u32_ptr(shared_va, LOCK_DEV_OFF);
    volatile uint32_t * const turn       = shm_u32_ptr(shared_va, TURN_OFF);

    *flag_self = 1u;
    host_fence();

    *turn = TURN_DEV;
    host_fence();

    while ((*flag_other != 0u) && (*turn == TURN_DEV)) {
        // spin
    }

    host_fence();
}

static inline void peterson_unlock_host(uint8_t *shared_va)
{
    volatile uint32_t * const flag_self = shm_u32_ptr(shared_va, LOCK_HOST_OFF);

    *flag_self = 0u;
    host_fence();
}

static int host_increment_n_times_shared_atomic(uint8_t *shared_va, uint32_t n)
{
    volatile uint32_t * const counter = shm_u32_ptr(shared_va, COUNTER_OFF);

    for (uint32_t i = 0; i < n; ++i) {
        peterson_lock_host(shared_va);

        uint32_t v = *counter;
        v = v + 1u;
        *counter = v;
        host_fence();

        peterson_unlock_host(shared_va);
    }

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

    *done = 0u;
    host_fence();
    return 0;
}

// IMPORTANT: free mem first, close dev later
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

static void print_usage(const char *prog)
{
    printf("Usage: %s [-n inc_count] [-b BDF]\n", prog);
    printf("  -n inc_count   Host increment count (default: %u)\n", DEFAULT_HOST_INC_COUNT);
    printf("  -b BDF         PCI BDF (default: 0000:41:00.0)\n");
}

int main(int argc, char **argv)
{
    const char *bdf = "0000:41:00.0";
    uint32_t host_inc_count = DEFAULT_HOST_INC_COUNT;

    int opt = 0;
    while ((opt = getopt(argc, argv, "n:b:h")) != -1) {
        switch (opt) {
        case 'n': {
            char *endp = NULL;
            unsigned long v = strtoul(optarg, &endp, 0);
            if (*optarg == '\0' || (endp && *endp != '\0') || v > 0xFFFFFFFFul) {
                fprintf(stderr, "Invalid -n value: %s\n", optarg);
                print_usage(argv[0]);
                return 1;
            }
            host_inc_count = (uint32_t)v;
            break;
        }
        case 'b':
            bdf = optarg;
            break;
        case 'h':
        default:
            print_usage(argv[0]);
            return 0;
        }
    }

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

    st = alloc_shared_buffer(&ctx, (size_t)SHARED_BYTES, SHARED_IOVA_BASE);
    if (st) {
        printf("alloc_shared_buffer failed: %d\n", st);
        cleanup_all(&ctx);
        return 1;
    }

    memset(ctx.shared_va, 0, ctx.shared_bytes);
    host_fence();

    host_prepare_shared_state(ctx.shared_va);

    printf("[shared] VA   = %p\n", (void *)ctx.shared_va);
    printf("[shared] IOVA = 0x%016" PRIx64 " (requested 0x%016" PRIx64 ")\n",
           ctx.shared_iova, (uint64_t)SHARED_IOVA_BASE);
    printf("[shared] size = 0x%zx bytes\n", ctx.shared_bytes);

    const uint64_t hps_target_addr = HPS_H2F_BASE + ctx.shared_iova + COUNTER_OFF;
    const uint64_t hps_hs_base     = HPS_H2F_BASE + ctx.shared_iova + HS_BASE_OFF;
    printf("[HPS] TARGET_ADDR should be 0x%016" PRIx64 "\n", hps_target_addr);
    printf("[HPS] HS_BASE     should be 0x%016" PRIx64 "\n", hps_hs_base);

    const uint32_t token = 0xA5A50001u;

    printf("\nHOST is ready. Waiting for DEVICE REQ(token=0x%08x)...\n", token);
    printf("(Run device/HPS program now)\n\n");

    st = host_wait_req_ack_wait_go(ctx.shared_va, token,
                                   /*poll_limit=*/0u,
                                   /*poll_sleep_us=*/1000u);
    if (st) {
        printf("handshake(wait-req/ack/wait-go) failed: %d\n", st);
        cleanup_all(&ctx);
        return 2;
    }

    printf("Handshake OK (GO seen). Start HOST atomic increment: %u times\n", host_inc_count);

    st = host_increment_n_times_shared_atomic(ctx.shared_va, host_inc_count);
    if (st) {
        printf("host atomic increment failed: %d\n", st);
        cleanup_all(&ctx);
        return 3;
    }

    printf("HOST atomic increment done. Waiting DEVICE DONE(token)...\n");

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

    printf("DONE seen+cleared. FINAL counter = 0x%08x (result : %u)\n", final, final);

    // next-run cleanup
    *shm_u32_ptr(ctx.shared_va, HS_REQ_OFF)    = 0u;
    *shm_u32_ptr(ctx.shared_va, HS_ACK_OFF)    = 0u;
    *shm_u32_ptr(ctx.shared_va, HS_GO_OFF)     = 0u;
    *shm_u32_ptr(ctx.shared_va, LOCK_HOST_OFF) = 0u;
    *shm_u32_ptr(ctx.shared_va, LOCK_DEV_OFF)  = 0u;
    *shm_u32_ptr(ctx.shared_va, TURN_OFF)      = TURN_HOST;
    host_fence();

    cleanup_all(&ctx);
    return 0;
}