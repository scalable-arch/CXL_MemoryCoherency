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

    h2d_write_buf_status = qcsr_init_queue(ctx, QCSR_DIR_H2D, QUEUE_ID, ctx->desc_iova, RING_ORDER_LOG2);
    if (h2d_write_buf_status) return h2d_write_buf_status;

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

// device DDR(src_dev_addr)의 데이터를 DMA(D2H)로 Host memory(dst)에 읽기
static int d2h_read_buf(dma_ctx_t *ctx, void *dst, uint64_t src_dev_addr, uint32_t len)
{
    int d2h_read_buf_status = 0;
    const uint32_t desc_idx = 1;

    if (!ctx || !dst) return -1;
    if (len == 0 || len > DMA_LEN_MAX_BYTES) return -1;

    // D2H 큐 reset+enable
    d2h_read_buf_status = qcsr_init_queue(ctx, QCSR_DIR_D2H, QUEUE_ID, ctx->desc_iova, RING_ORDER_LOG2);
    if (d2h_read_buf_status) return d2h_read_buf_status;

    // RX 버퍼를 미리 초기화(선택)
    memset(ctx->rx_va, 0x00, len);
    atomic_thread_fence(memory_order_release);

    // D2H descriptor 작성: device(src_dev_addr) -> host(rx_iova)
    d2h_read_buf_status = write_desc_d2h(ctx, desc_idx, src_dev_addr, len);
    if (d2h_read_buf_status) return d2h_read_buf_status;

    d2h_read_buf_status = doorbell(ctx, QCSR_DIR_D2H, QUEUE_ID, desc_idx);
    if (d2h_read_buf_status) return d2h_read_buf_status;

    d2h_read_buf_status = poll_complete(ctx, QCSR_DIR_D2H, QUEUE_ID, desc_idx, NULL);
    if (d2h_read_buf_status) return d2h_read_buf_status;

    // RX 버퍼에서 사용자 버퍼로 복사
    memcpy(dst, ctx->rx_va, len);
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

    // 4B로 테스트 (정렬 요구 대응)
    const uint32_t len = 4;
    const uint32_t io_map_bytes = 4096;

    // H2D + D2H 모두 필요하므로 rx_bytes도 할당
    main_status = alloc_dma_buffers(&ctx, 4096, io_map_bytes, io_map_bytes);
    if (main_status) {
        printf("alloc_dma_buffers failed: %d\n", main_status);
        cleanup(&ctx);
        return 1;
    }

    // device DDR을 DMA가 0x0부터 본다고 가정
    const uint64_t dev_addr = 0x40000000ull;

    // 0x0에 0xFF 쓰기
    uint8_t wr[len];
    for (uint32_t i = 0; i < len; i++) wr[i] = 0x12;

    main_status = h2d_write_buf(&ctx, dev_addr, wr, len);
    if (main_status) {
        printf("H2D DMA write failed: %d\n", main_status);
        cleanup(&ctx);
        return 1;
    }

    // 0x0에서 다시 읽기
    uint8_t rd[len];
    memset(rd, 0x00, sizeof(rd));

    main_status = d2h_read_buf(&ctx, rd, dev_addr, len);
    if (main_status) {
        printf("D2H DMA read failed: %d\n", main_status);
        cleanup(&ctx);
        return 1;
    }

    // 검증
    int pass = 1;
    for (uint32_t i = 0; i < len; i++) {
        if (rd[i] != 0x12) { pass = 0; break; }
    }

    printf("Wrote  : ");
    for (uint32_t i = 0; i < len; i++) printf("%02X ", wr[i]);
    printf("\nRead   : ");
    for (uint32_t i = 0; i < len; i++) printf("%02X ", rd[i]);
    printf("\nResult : %s (dev_addr=0x%016" PRIx64 ")\n", pass ? "PASS" : "FAIL", dev_addr);

    cleanup(&ctx);
    return pass ? 0 : 2;
}
