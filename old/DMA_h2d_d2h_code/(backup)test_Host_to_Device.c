#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <inttypes.h>
#include <stdatomic.h>
#include <limits.h>

#include "dma.lib.h"

// Host memory(src)의 데이터를 DMA(H2D)로 device DDR(dst_dev_addr)에 쓰기
static int h2d_write_buf(dma_ctx_t *ctx, uint64_t dst_dev_addr, const void *src, uint32_t len)
{
    int h2d_write_buf_status = 0;
    const uint32_t desc_idx = 1;

    if (!ctx || !src) return -1;
    if (len == 0 || len > DMA_LEN_MAX_BYTES) return -1;

    // 큐 reset+enable (desc_idx=1 재사용)
    h2d_write_buf_status = qcsr_init_queue(ctx, QCSR_DIR_H2D, QUEUE_ID, ctx->desc_iova, RING_ORDER_LOG2);
    if (h2d_write_buf_status) return h2d_write_buf_status;

    // DMA source는 ctx->tx_iova(=ctx->tx_va)이므로, 원하는 Host 데이터를 tx_va로 복사
    memcpy(ctx->tx_va, src, len);
    atomic_thread_fence(memory_order_release);

    h2d_write_buf_status = write_desc_h2d(ctx, desc_idx, dst_dev_addr, len);
    if (h2d_write_buf_status) return h2d_write_buf_status;

    h2d_write_buf_status = doorbell(ctx, QCSR_DIR_H2D, QUEUE_ID, desc_idx);
    if (h2d_write_buf_status) return h2d_write_buf_status;

    h2d_write_buf_status = poll_complete(ctx, QCSR_DIR_H2D, QUEUE_ID, desc_idx, NULL);
    if (h2d_write_buf_status) return h2d_write_buf_status;

    return 0;
}

int main(int argc, char **argv)
{
    const char *bdf = (argc >= 2) ? argv[1] : "0000:41:00.0";

    dma_ctx_t ctx = (dma_ctx_t){0};
    ctx.desc_memid = ctx.tx_memid = ctx.rx_memid = UINT32_MAX;

    int main_status = init_vfio(&ctx, bdf);
    if (main_status) {
        printf("init_vfio failed: %d\n", main_status);
        return 1;
    }

    // 예시: Host에서 256B를 device DDR 0x0에 씀
    const uint32_t len = 256;
    const uint32_t tx_map_bytes = 4096;

    // H2D만 할 거라 rx_bytes=0
    main_status = alloc_dma_buffers(&ctx, 4096, tx_map_bytes, 0);
    if (main_status) {
        printf("alloc_dma_buffers failed: %d\n", main_status);
        cleanup(&ctx);
        return 1;
    }

    // Host memory의 "특정 영역" 예시(원하는 데이터로 대체 가능)
    uint8_t host_buf[256];
    for (uint32_t i = 0; i < len; i++) host_buf[i] = (uint8_t)i;

    // device DDR을 DMA가 0x0부터 본다고 가정
    const uint64_t dev_ddr_dst = 0x0ull;

    main_status = h2d_write_buf(&ctx, dev_ddr_dst, host_buf, len);
    if (main_status) {
        printf("H2D DMA write failed: %d\n", main_status);
        cleanup(&ctx);
        return 1;
    }

    printf("H2D DMA write OK: %uB -> device HBM2e @0x%016" PRIx64 "\n", len, dev_ddr_dst);

    cleanup(&ctx);
    return 0;
}