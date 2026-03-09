#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <inttypes.h>
#include <stdatomic.h>
#include <unistd.h>   // usleep
#include <errno.h>    // ETIMEDOUT
#include <stdlib.h>   // strtoul

#include "dma.lib.h"

#define HS_XFER_WORDS       (8u)
#define HS_XFER_BYTES       (32u)   // 8 words * 4B
#define HS_DONE_WORD_IDX    (3u)    // HS_BASE + 0xC => word index 3

// --------------------
// (예제 스타일 그대로) H2D/D2H DMA 헬퍼
// --------------------

// Host memory(src)의 데이터를 DMA(H2D)로 device DDR(dst_dev_addr)에 쓰기
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

// device DDR(src_dev_addr)의 데이터를 DMA(D2H)로 Host memory(dst)에 읽기
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

// --------------------
// HPS barrier_handshake()에 맞춘 Host 핸드셰이크
// --------------------
static int host_barrier_handshake_dma(dma_ctx_t *ctx,
                                      uint64_t hs_base_devaddr,
                                      uint32_t token,
                                      uint32_t poll_limit,
                                      uint32_t poll_sleep_us)
{
    uint32_t wr[8] = {0};
    uint32_t rd[8] = {0};
    const uint32_t xfer_len = (uint32_t)sizeof(wr);

    // (1) REQ=token, ACK/GO=0
    wr[0] = token;  // REQ @ +0x0
    wr[1] = 0;      // ACK @ +0x4
    wr[2] = 0;      // GO  @ +0x8
    int st = h2d_write_buf(ctx, hs_base_devaddr, wr, xfer_len);
    if (st) return st;

    // (2) ACK==token 폴링
    for (uint32_t i = 0; i < poll_limit; ++i) {
        st = d2h_read_buf(ctx, rd, hs_base_devaddr, xfer_len);
        if (st) return st;

        if (rd[1] == token) break;
        if (poll_sleep_us) usleep(poll_sleep_us);
    }
    if (rd[1] != token) return -ETIMEDOUT;

    // (3) GO=token
    wr[0] = token;
    wr[1] = token;
    wr[2] = token;
    st = h2d_write_buf(ctx, hs_base_devaddr, wr, xfer_len);
    if (st) return st;

    // (선택) GO read-back
    st = d2h_read_buf(ctx, rd, hs_base_devaddr, xfer_len);
    if (st) return st;
    if (rd[2] != token) return -EIO;

    return 0;
}

// --------------------
// Handshake 이후 Host 측 increment (정해진 횟수)
// --------------------
#define DEFAULT_HOST_INC_COUNT        (50000u)   // Host increment 횟수 (원하면 값만 바꾸면 됨)
#define COUNTER_XFER_BYTES    (32u)      // 예제 스타일 유지: 32B 단위로 읽고/쓰면서 word0만 ++

static int host_increment_n_times(dma_ctx_t *ctx, uint64_t dev_counter_addr, uint32_t n)
{
    int st = 0;
    uint32_t buf[8] = {0}; // 32B

    for (uint32_t i = 0; i < n; ++i) {
        st = d2h_read_buf(ctx, buf, dev_counter_addr, COUNTER_XFER_BYTES);
        if (st) return st;

        buf[0] = buf[0] + 1u;

        st = h2d_write_buf(ctx, dev_counter_addr, buf, COUNTER_XFER_BYTES);
        if (st) return st;
    }

    return 0;
}

static int host_wait_hps_done(dma_ctx_t *ctx,
                              uint64_t dev_hs_base,
                              uint32_t token,
                              uint32_t poll_limit,
                              uint32_t poll_sleep_us)
{
    int st = 0;
    uint32_t rd[HS_XFER_WORDS] = {0};

    for (uint32_t i = 0; i < poll_limit; ++i) {
        st = d2h_read_buf(ctx, rd, dev_hs_base, HS_XFER_BYTES);
        if (st) return st;

        if (rd[HS_DONE_WORD_IDX] == token) {
            return 0; // HPS done
        }

        if (poll_sleep_us) usleep(poll_sleep_us);
    }

    return -ETIMEDOUT;
}

static int host_clear_hps_done(dma_ctx_t *ctx, uint64_t dev_hs_base)
{
    int st = 0;
    uint32_t rd[HS_XFER_WORDS] = {0};

    // read-modify-write로 word3(DONE)만 0으로
    st = d2h_read_buf(ctx, rd, dev_hs_base, HS_XFER_BYTES);
    if (st) return st;

    rd[HS_DONE_WORD_IDX] = 0u;

    st = h2d_write_buf(ctx, dev_hs_base, rd, HS_XFER_BYTES);
    if (st) return st;

    return 0;
}

//스크립트용
static void print_usage(const char *prog)
{
    printf("Usage: %s [-n inc_count] [-b BDF]\n", prog);
    printf("  -n inc_count   Host increment count (default: %u)\n", DEFAULT_HOST_INC_COUNT);
    printf("  -b BDF         PCI BDF (default: 0000:41:00.0)\n");
}

int main(int argc, char **argv)
{
    // 이하 스크립트용
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

    st = alloc_dma_buffers(&ctx, 4096, 4096, 4096);
    if (st) {
        printf("alloc_dma_buffers failed: %d\n", st);
        cleanup(&ctx);
        return 1;
    }

    printf("IOVA(desc) = 0x%016" PRIx64 "\n", ctx.desc_iova);
    printf("IOVA(tx)   = 0x%016" PRIx64 "\n", ctx.tx_iova);
    printf("IOVA(rx)   = 0x%016" PRIx64 "\n", ctx.rx_iova);

    // Host(DMA) 기준 주소
    const uint64_t dev_counter_addr = 0x00000000ull;
    const uint64_t dev_hs_base      = 0x00100000ull;

    const uint32_t token = 0xA5A50001u;

    printf("Handshake start: hs_base=0x%016" PRIx64 ", token=0x%08x\n",
           dev_hs_base, token);

    st = host_barrier_handshake_dma(&ctx, dev_hs_base, token,
                                    /*poll_limit=*/5000u,
                                    /*poll_sleep_us=*/1000u);
    if (st) {
        printf("handshake failed: %d\n", st);
        cleanup(&ctx);
        return 2;
    }

    printf("Handshake OK (GO sent). Start HOST increment: %u times\n", host_inc_count);

    // Host도 정해진 횟수만큼 increment 수행
    st = host_increment_n_times(&ctx, dev_counter_addr, host_inc_count);
    if (st) {
        printf("host increment failed: %d\n", st);
        cleanup(&ctx);
        return 3;
    }

    printf("HOST increment done.\n");

    // 1) HPS 완료(DONE=token) 대기
    st = host_wait_hps_done(&ctx, dev_hs_base, token,
                            /*poll_limit=*/5000u,
                            /*poll_sleep_us=*/1000u); // 1ms * 5000 = 최대 5초
    if (st) {
        printf("wait HPS done failed: %d\n", st);
        cleanup(&ctx);
        return 4;
    }
    printf("HPS done detected.\n");

    // 2) 최종 counter 읽어서 출력
    uint32_t final_rd[8] = {0};
    st = d2h_read_buf(&ctx, final_rd, dev_counter_addr, (uint32_t)sizeof(final_rd));
    if (st) {
        printf("final counter read failed: %d\n", st);
        cleanup(&ctx);
        return 5;
    }
    printf("FINAL counter = 0x%08x (%u)\n", final_rd[0], final_rd[0]);

    // 3) DONE 비트 초기화(0으로)
    st = host_clear_hps_done(&ctx, dev_hs_base);
    if (st) {
        printf("clear HPS done failed: %d\n", st);
        cleanup(&ctx);
        return 6;
    }
    printf("HPS done cleared.\n");
    cleanup(&ctx);
    return 0;
}