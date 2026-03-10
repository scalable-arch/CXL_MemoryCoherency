#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <stdatomic.h>

#include "dma.lib.h"

#define TEST_COUNT            (15u)
#define DEV_MEM_BASE_ADDR     (0x00000000ull)
#define DEV_MEM_STRIDE_BYTES  (4u)   // 0x0, 0x4, 0x8, ...
#define U32_XFER_BYTES        (4u)

static int h2d_write_buf(dma_ctx_t *ctx, uint64_t dst_dev_addr, const void *src, uint32_t len)
{
    int st = 0;
    const uint32_t desc_idx = 1;

    if (!ctx || !src) return -1;
    if (len == 0 || len > DMA_LEN_MAX_BYTES) return -1;

    st = qcsr_init_queue(ctx, QCSR_DIR_H2D, QUEUE_ID, ctx->desc_iova, RING_ORDER_LOG2);
    if (st) return st;

    memcpy(ctx->tx_va, src, len);
    atomic_thread_fence(memory_order_release);

    st = write_desc_h2d(ctx, desc_idx, dst_dev_addr, len);
    if (st) return st;

    st = doorbell(ctx, QCSR_DIR_H2D, QUEUE_ID, desc_idx);
    if (st) return st;

    st = poll_complete(ctx, QCSR_DIR_H2D, QUEUE_ID, desc_idx, NULL);
    if (st) return st;

    return 0;
}

static int d2h_read_buf(dma_ctx_t *ctx, void *dst, uint64_t src_dev_addr, uint32_t len)
{
    int st = 0;
    const uint32_t desc_idx = 1;

    if (!ctx || !dst) return -1;
    if (len == 0 || len > DMA_LEN_MAX_BYTES) return -1;

    st = qcsr_init_queue(ctx, QCSR_DIR_D2H, QUEUE_ID, ctx->desc_iova, RING_ORDER_LOG2);
    if (st) return st;

    memset(ctx->rx_va, 0x00, len);
    atomic_thread_fence(memory_order_release);

    st = write_desc_d2h(ctx, desc_idx, src_dev_addr, len);
    if (st) return st;

    st = doorbell(ctx, QCSR_DIR_D2H, QUEUE_ID, desc_idx);
    if (st) return st;

    st = poll_complete(ctx, QCSR_DIR_D2H, QUEUE_ID, desc_idx, NULL);
    if (st) return st;

    memcpy(dst, ctx->rx_va, len);
    return 0;
}

static int write_dev_u32(dma_ctx_t *ctx, uint64_t dev_addr, uint32_t value)
{
    return h2d_write_buf(ctx, dev_addr, &value, U32_XFER_BYTES);
}

static int read_dev_u32(dma_ctx_t *ctx, uint64_t dev_addr, uint32_t *value)
{
    return d2h_read_buf(ctx, value, dev_addr, U32_XFER_BYTES);
}

int main(void)
{
    const char *bdf = "0000:41:00.0";

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

    st = alloc_dma_buffers(&ctx, 4096, 4096, 4096);
    if (st) {
        printf("alloc_dma_buffers failed: %d\n", st);
        cleanup(&ctx);
        return 2;
    }

    printf("[INFO] using device memory DMA read/write test\n");
    printf("       bdf=%s base=0x%08llx stride=0x%x count=%u\n",
           bdf,
           (unsigned long long)DEV_MEM_BASE_ADDR,
           DEV_MEM_STRIDE_BYTES,
           TEST_COUNT);

    printf("[INFO] IOVA(desc) = 0x%016" PRIx64 "\n", ctx.desc_iova);
    printf("[INFO] IOVA(tx)   = 0x%016" PRIx64 "\n", ctx.tx_iova);
    printf("[INFO] IOVA(rx)   = 0x%016" PRIx64 "\n", ctx.rx_iova);

    uint32_t orig_vals[TEST_COUNT] = {0};
    uint32_t restored_vals[TEST_COUNT] = {0};

    for (uint32_t i = 0; i < TEST_COUNT; ++i) {
        uint64_t dev_addr = DEV_MEM_BASE_ADDR + ((uint64_t)i * DEV_MEM_STRIDE_BYTES);
        st = read_dev_u32(&ctx, dev_addr, &orig_vals[i]);
        if (st) {
            printf("[FAIL] read original addr 0x%08llx failed: %d\n",
                   (unsigned long long)dev_addr, st);
            cleanup(&ctx);
            return 3;
        }
    }

    printf("[INFO] original values captured for %u locations\n", TEST_COUNT);

    uint32_t pass_cnt = 0u;
    uint32_t fail_cnt = 0u;

    for (uint32_t i = 0; i < TEST_COUNT; ++i) {
        uint64_t dev_addr = DEV_MEM_BASE_ADDR + ((uint64_t)i * DEV_MEM_STRIDE_BYTES);
        uint32_t write_val = 0xA5A50000u | i;
        uint32_t rd_back = 0u;

        st = write_dev_u32(&ctx, dev_addr, write_val);
        if (st) {
            printf("[FAIL] addr 0x%08llx write 0x%08x failed: %d\n",
                   (unsigned long long)dev_addr, write_val, st);
            fail_cnt++;
            continue;
        }

        st = read_dev_u32(&ctx, dev_addr, &rd_back);
        if (st) {
            printf("[FAIL] addr 0x%08llx readback failed after write 0x%08x: %d\n",
                   (unsigned long long)dev_addr, write_val, st);
            fail_cnt++;
            continue;
        }

        if (rd_back == write_val) {
            printf("[PASS] addr 0x%08llx write 0x%08x -> read 0x%08x\n",
                   (unsigned long long)dev_addr, write_val, rd_back);
            pass_cnt++;
        } else {
            printf("[WARN] addr 0x%08llx write 0x%08x -> read 0x%08x\n",
                   (unsigned long long)dev_addr, write_val, rd_back);
            fail_cnt++;
        }
    }

    for (uint32_t i = 0; i < TEST_COUNT; ++i) {
        uint64_t dev_addr = DEV_MEM_BASE_ADDR + ((uint64_t)i * DEV_MEM_STRIDE_BYTES);

        st = write_dev_u32(&ctx, dev_addr, orig_vals[i]);
        if (st) {
            printf("[FAIL] restore addr 0x%08llx to 0x%08x failed: %d\n",
                   (unsigned long long)dev_addr, orig_vals[i], st);
            cleanup(&ctx);
            return 4;
        }

        st = read_dev_u32(&ctx, dev_addr, &restored_vals[i]);
        if (st) {
            printf("[FAIL] read restored addr 0x%08llx failed: %d\n",
                   (unsigned long long)dev_addr, st);
            cleanup(&ctx);
            return 5;
        }

        if (restored_vals[i] == orig_vals[i]) {
            printf("[PASS] restore addr 0x%08llx -> 0x%08x\n",
                   (unsigned long long)dev_addr, restored_vals[i]);
        } else {
            printf("[WARN] restore addr 0x%08llx expected 0x%08x got 0x%08x\n",
                   (unsigned long long)dev_addr, orig_vals[i], restored_vals[i]);
        }
    }

    printf("[SUMMARY] pass=%u fail=%u\n", pass_cnt, fail_cnt);

    cleanup(&ctx);

    if (fail_cnt == 0u) {
        return 0;
    }
    return 6;
}