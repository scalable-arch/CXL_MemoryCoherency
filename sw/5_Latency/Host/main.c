#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <stdatomic.h>

#include "dma.lib.h"

#define SHARED_IOVA_BASE      (0x01000000ull)
#define SHARED_BYTES          (4096u)

#define HPS_H2F_BASE          (0x80000000ull)
#define HPS_TARGET_ADDR       (HPS_H2F_BASE + SHARED_IOVA_BASE)

#define READ_COUNT            (10u)
#define READ_STRIDE_BYTES     (64u)
#define TEST_FILL_BYTES       (READ_COUNT * READ_STRIDE_BYTES)

static volatile sig_atomic_t g_stop = 0;

static void on_sigint(int sig)
{
    (void)sig;
    g_stop = 1;
}

static inline void host_fence(void)
{
    atomic_thread_fence(memory_order_seq_cst);
}

/*
 * Free shared memory first, then close the VFIO device.
 * This keeps the cleanup order safe for the shared-memory mapping case.
 */
static void cleanup_init_only(dma_ctx_t *ctx)
{
    if (!ctx) return;

    if (ctx->shared_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, (uint32_t)ctx->shared_memid);
        ctx->shared_memid = -1;
    }

    ctx->shared_va = NULL;
    ctx->shared_iova = 0;
    ctx->shared_bytes = 0;

    bwvfio_close_dev(&ctx->dev);
}

/*
 * Fill the shared memory region with a deterministic pattern so that
 * the HPS latency test reads valid data from the target address range.
 */
static void fill_test_pattern(uint8_t *base, size_t bytes)
{
    if (!base || bytes == 0) return;

    memset(base, 0, bytes);

    uint32_t *p = (uint32_t *)(void *)base;
    size_t word_count = bytes / sizeof(uint32_t);

    for (size_t i = 0; i < word_count; ++i) {
        p[i] = (uint32_t)(0xA5A50000u + (uint32_t)i);
    }

    host_fence();
}

int main(int argc, char **argv)
{
    const char *bdf = (argc >= 2) ? argv[1] : "0000:41:00.0";

    signal(SIGINT, on_sigint);

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

    st = alloc_shared_buffer(&ctx, SHARED_BYTES, SHARED_IOVA_BASE);
    if (st) {
        printf("alloc_shared_buffer failed: %d\n", st);
        cleanup_init_only(&ctx);
        return 2;
    }

    fill_test_pattern(ctx.shared_va, TEST_FILL_BYTES);

    printf("[INFO] Host shared-memory init done.\n");
    printf("[INFO] BDF            = %s\n", bdf);
    printf("[INFO] shared VA      = %p\n", (void *)ctx.shared_va);
    printf("[INFO] shared IOVA    = 0x%016" PRIx64 "\n", ctx.shared_iova);
    printf("[INFO] shared bytes   = 0x%zx\n", ctx.shared_bytes);
    printf("[INFO] HPS target     = 0x%016" PRIx64 "\n", (uint64_t)HPS_TARGET_ADDR);
    printf("[INFO] filled bytes   = 0x%x (%u reads x %uB stride)\n",
           TEST_FILL_BYTES, READ_COUNT, READ_STRIDE_BYTES);
    printf("[INFO] Keep this process alive while running the HPS latency test.\n");
    printf("[INFO] Press Ctrl-C after the HPS test finishes.\n");

    while (!g_stop) {
        sleep(1);
    }

    printf("[INFO] cleaning up shared-memory mapping...\n");
    cleanup_init_only(&ctx);
    printf("[INFO] done.\n");

    return 0;
}