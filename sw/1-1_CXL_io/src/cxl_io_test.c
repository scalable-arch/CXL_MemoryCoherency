#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

#include "dma.lib.h"

static int qcsr_reset_queue_mmio(dma_ctx_t *ctx, uint32_t dir, uint32_t q)
{
    int st = 0;
    uint32_t reset_val = 0;
    uint32_t reset_off = QCSR_ADDR(dir, q, Q_RESET_OFF);

    st = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, reset_off, 1u);
    if (st) return st;

    do {
        st = bwvfio_ms_read32(&ctx->dev, QCSR_REGION, reset_off, &reset_val);
        if (st) return st;
    } while (reset_val != 0u);

    return 0;
}

static void close_only(dma_ctx_t *ctx)
{
    if (!ctx) return;
    bwvfio_close_dev(&ctx->dev);
}

int main(void)
{
    const char *bdf = "0000:41:00.0";
    const uint32_t dir = QCSR_DIR_D2H;
    const uint32_t qid = 0u;

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

    st = qcsr_reset_queue_mmio(&ctx, dir, qid);
    if (st) {
        printf("queue reset failed: %d\n", st);
        close_only(&ctx);
        return 2;
    }

    const uint32_t test_off = QCSR_ADDR(dir, qid, Q_SIZE_OFF);

    printf("[INFO] using QCSR Q_SIZE register\n");
    printf("       bdf=%s dir=d2h qid=%u off=0x%08x\n", bdf, qid, test_off);

    uint32_t orig_val = 0u;
    st = bwvfio_ms_read32(&ctx.dev, QCSR_REGION, test_off, &orig_val);
    if (st) {
        printf("read original failed: %d\n", st);
        close_only(&ctx);
        return 3;
    }

    printf("[INFO] original val = 0x%08x\n", orig_val);

    uint32_t pass_cnt = 0u;
    uint32_t fail_cnt = 0u;

    for (uint32_t write_val = 1u; write_val <= 0xEu; ++write_val) {
        uint32_t rd_back = 0u;

        st = bwvfio_ms_write32(&ctx.dev, QCSR_REGION, test_off, write_val);
        if (st) {
            printf("[FAIL] write 0x%08x failed: %d\n", write_val, st);
            fail_cnt++;
            continue;
        }

        st = bwvfio_ms_read32(&ctx.dev, QCSR_REGION, test_off, &rd_back);
        if (st) {
            printf("[FAIL] readback after write 0x%08x failed: %d\n", write_val, st);
            fail_cnt++;
            continue;
        }

        if (rd_back == write_val) {
            printf("[PASS] write 0x%08x -> read 0x%08x\n", write_val, rd_back);
            pass_cnt++;
        } else {
            printf("[WARN] write 0x%08x -> read 0x%08x\n", write_val, rd_back);
            fail_cnt++;
        }
    }

    // restore original
    st = bwvfio_ms_write32(&ctx.dev, QCSR_REGION, test_off, orig_val);
    if (st) {
        printf("restore original failed: %d\n", st);
        close_only(&ctx);
        return 4;
    }

    uint32_t restored = 0u;
    st = bwvfio_ms_read32(&ctx.dev, QCSR_REGION, test_off, &restored);
    if (st) {
        printf("read restored value failed: %d\n", st);
        close_only(&ctx);
        return 5;
    }

    printf("[INFO] restored val = 0x%08x\n", restored);

    if (restored == orig_val) {
        printf("[PASS] original value restored.\n");
    } else {
        printf("[WARN] restore mismatched. expected=0x%08x got=0x%08x\n",
               orig_val, restored);
    }

    printf("[SUMMARY] pass=%u fail=%u\n", pass_cnt, fail_cnt);

    close_only(&ctx);

    if (fail_cnt == 0u) {
        return 0;
    }
    return 6;
}