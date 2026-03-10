/*
Explanation
이 코드는 호스트가 DMA를 통해 디바이스 메모리의 카운터와 핸드셰이크 영역에 접근하는 코드이다.
호스트는 먼저 DMA read/write helper를 사용해 디바이스 메모리의 32B 블록을 읽고 쓸 수 있도록 준비한다.
이후 카운터, lock 변수, turn 값을 초기화하고, 핸드셰이크 영역에 REQ/ACK/GO/DONE 값을 사용해 실행을 동기화한다.
핸드셰이크가 끝나면 호스트는 Dekker mutex를 이용해 디바이스와 상호 배제를 맞추면서 카운터를 증가시킨다.
호스트 increment가 끝난 뒤에는 HPS 측 DONE 신호를 기다리고, 결과 재읽기 요청을 보내 최신 결과 반영을 요청한다.
그 다음 refresh ACK를 확인한 뒤 최종 counter 값을 다시 읽어 출력하고, 관련 플래그를 정리한다.
마지막으로 DMA/VFIO 자원을 해제하고 프로그램을 종료한다.
*/

#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <inttypes.h>
#include <stdatomic.h>
#include <unistd.h>
#include <errno.h>
#include <stdlib.h>

#include "dma.lib.h"

#define HS_XFER_WORDS              (8u)
#define HS_XFER_BYTES              (32u)   // one DMA block
#define HS_DONE_WORD_IDX           (3u)    // HS_BASE + 0xC
#define HS_REFRESH_REQ_WORD_IDX    (4u)    // HS_BASE + 0x10
#define HS_REFRESH_ACK_WORD_IDX    (5u)    // HS_BASE + 0x14

#define DEFAULT_HOST_INC_COUNT     (50000u)
#define COUNTER_XFER_BYTES         (32u)

/*
 * Device memory map from host DMA point of view:
 *   counter block : 0x00000000
 *   handshake     : 0x00100000
 *   lock_host     : 0x00100020
 *   lock_dev      : 0x00100040
 *   turn          : 0x00100060
 */
#define DEV_COUNTER_ADDR       (0x00000000ull)
#define DEV_HS_BASE            (0x00100000ull)
#define DEV_LOCK_HOST_ADDR     (DEV_HS_BASE + 0x20ull)
#define DEV_LOCK_DEV_ADDR      (DEV_HS_BASE + 0x40ull)
#define DEV_TURN_ADDR          (DEV_HS_BASE + 0x60ull)

#define TURN_HOST              (0u)
#define TURN_DEV               (1u)


/*
호스트 버퍼의 데이터를 디바이스 주소로 DMA write 하는 함수.
TX 버퍼에 데이터를 복사한 뒤 descriptor를 설정하고, doorbell과 completion polling을 통해 H2D 전송을 완료한다.
*/
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

/*
디바이스 주소의 데이터를 호스트 버퍼로 DMA read 하는 함수.
RX 버퍼를 비운 뒤 descriptor를 설정하고, doorbell과 completion polling을 통해 D2H 전송을 완료한다.
*/
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


/*
32B 블록을 디바이스에 쓰는 간단한 helper 함수.
실제로는 word0에만 값을 넣고, 나머지 word는 0으로 채운 뒤 DMA write를 수행한다.
*/
static int write_u32_block(dma_ctx_t *ctx, uint64_t dev_addr, uint32_t value)
{
    uint32_t wr[HS_XFER_WORDS] = {0};
    wr[0] = value;
    return h2d_write_buf(ctx, dev_addr, wr, HS_XFER_BYTES);
}

/*
32B 블록을 디바이스에서 읽는 간단한 helper 함수.
DMA read로 32B 전체를 읽어 온 뒤, 실제로 필요한 word0 값만 추출해 반환한다.
*/
static int read_u32_block(dma_ctx_t *ctx, uint64_t dev_addr, uint32_t *value)
{
    int st = 0;
    uint32_t rd[HS_XFER_WORDS] = {0};

    if (!value) return -1;

    st = d2h_read_buf(ctx, rd, dev_addr, HS_XFER_BYTES);
    if (st) return st;

    *value = rd[0];
    return 0;
}

/*
atomic increment 실행 전에 필요한 디바이스 상태를 초기화하는 함수.
카운터를 0으로 만들고, host/dev lock을 해제 상태로 두며, turn 값을 host 쪽으로 설정해 초기 동기화 상태를 맞춘다.
*/
static int host_prepare_atomic_state(dma_ctx_t *ctx,
                                     uint64_t dev_counter_addr,
                                     uint64_t dev_lock_host_addr,
                                     uint64_t dev_lock_dev_addr,
                                     uint64_t dev_turn_addr)
{
    int st = 0;

    st = write_u32_block(ctx, dev_counter_addr, 0u);
    if (st) return st;

    st = write_u32_block(ctx, dev_lock_host_addr, 0u);
    if (st) return st;

    st = write_u32_block(ctx, dev_lock_dev_addr, 0u);
    if (st) return st;

    st = write_u32_block(ctx, dev_turn_addr, TURN_HOST);
    if (st) return st;

    return 0;
}

/*
호스트와 HPS 사이의 시작 핸드셰이크를 DMA로 수행하는 함수.
먼저 counter와 mutex 상태를 초기화한 뒤, REQ를 쓰고 ACK를 기다린 다음 GO를 써서 실행 시작을 알린다.
*/
static int host_barrier_handshake_dma(dma_ctx_t *ctx,
                                      uint64_t dev_counter_addr,
                                      uint64_t dev_hs_base,
                                      uint64_t dev_lock_host_addr,
                                      uint64_t dev_lock_dev_addr,
                                      uint64_t dev_turn_addr,
                                      uint32_t token,
                                      uint32_t poll_limit,
                                      uint32_t poll_sleep_us)
{
    int st = 0;
    uint32_t wr[HS_XFER_WORDS] = {0};
    uint32_t rd[HS_XFER_WORDS] = {0};

    // important: initialize counter + mutex state BEFORE starting both sides
    st = host_prepare_atomic_state(ctx,
                                   dev_counter_addr,
                                   dev_lock_host_addr,
                                   dev_lock_dev_addr,
                                   dev_turn_addr);
    if (st) return st;

    // REQ=token, ACK/GO/DONE/REFRESH_REQ/REFRESH_ACK=0
    wr[0] = token;  // REQ
    wr[1] = 0u;     // ACK
    wr[2] = 0u;     // GO
    wr[3] = 0u;     // DONE
    wr[4] = 0u;     // REFRESH_REQ
    wr[5] = 0u;     // REFRESH_ACK
    st = h2d_write_buf(ctx, dev_hs_base, wr, HS_XFER_BYTES);
    if (st) return st;

    // wait ACK==token
    for (uint32_t i = 0; i < poll_limit; ++i) {
        st = d2h_read_buf(ctx, rd, dev_hs_base, HS_XFER_BYTES);
        if (st) return st;

        if (rd[1] == token) break;
        if (poll_sleep_us) usleep(poll_sleep_us);
    }
    if (rd[1] != token) return -ETIMEDOUT;

    // GO=token
    wr[0] = token;
    wr[1] = token;
    wr[2] = token;
    wr[3] = 0u;
    wr[4] = 0u;
    wr[5] = 0u;
    st = h2d_write_buf(ctx, dev_hs_base, wr, HS_XFER_BYTES);
    if (st) return st;

    // optional GO readback
    st = d2h_read_buf(ctx, rd, dev_hs_base, HS_XFER_BYTES);
    if (st) return st;
    if (rd[2] != token) return -EIO;

    return 0;
}

/*
호스트 측 Dekker lock 획득 함수.
자신의 lock 의사를 먼저 표시하고, 상대가 이미 진입 의사를 가진 경우 turn 값을 보며 양보와 재시도를 수행한다.
*/
static int host_dekker_lock(dma_ctx_t *ctx,
                            uint64_t dev_lock_host_addr,
                            uint64_t dev_lock_dev_addr,
                            uint64_t dev_turn_addr)
{
    int st = 0;
    uint32_t other = 0u;
    uint32_t turn  = 0u;

    st = write_u32_block(ctx, dev_lock_host_addr, 1u);
    if (st) return st;

    for (;;) {
        st = read_u32_block(ctx, dev_lock_dev_addr, &other);
        if (st) return st;

        if (other == 0u) {
            return 0;
        }

        st = read_u32_block(ctx, dev_turn_addr, &turn);
        if (st) return st;

        if (turn == TURN_DEV) {
            st = write_u32_block(ctx, dev_lock_host_addr, 0u);
            if (st) return st;

            do {
                st = read_u32_block(ctx, dev_turn_addr, &turn);
                if (st) return st;
            } while (turn == TURN_DEV);

            st = write_u32_block(ctx, dev_lock_host_addr, 1u);
            if (st) return st;
        }
    }
}

/*
호스트 측 Dekker lock 해제 함수.
turn을 디바이스 쪽으로 넘기고, 호스트 lock flag를 내려 임계 구역 사용 종료를 알린다.
*/
static int host_dekker_unlock(dma_ctx_t *ctx,
                              uint64_t dev_lock_host_addr,
                              uint64_t dev_turn_addr)
{
    int st = 0;

    st = write_u32_block(ctx, dev_turn_addr, TURN_DEV);
    if (st) return st;

    st = write_u32_block(ctx, dev_lock_host_addr, 0u);
    if (st) return st;

    return 0;
}

/*
호스트가 디바이스 메모리의 counter를 반복 증가시키는 함수.
각 증가 연산은 Dekker lock으로 보호되며, read-modify-write 순서로 counter 값을 갱신한다.
*/
static int host_increment_n_times_atomic(dma_ctx_t *ctx,
                                         uint64_t dev_counter_addr,
                                         uint64_t dev_lock_host_addr,
                                         uint64_t dev_lock_dev_addr,
                                         uint64_t dev_turn_addr,
                                         uint32_t n)
{
    int st = 0;
    uint32_t value = 0u;

    for (uint32_t i = 0; i < n; ++i) {
        st = host_dekker_lock(ctx, dev_lock_host_addr, dev_lock_dev_addr, dev_turn_addr);
        if (st) return st;

        st = read_u32_block(ctx, dev_counter_addr, &value);
        if (st) return st;

        value = value + 1u;

        st = write_u32_block(ctx, dev_counter_addr, value);
        if (st) return st;

        st = host_dekker_unlock(ctx, dev_lock_host_addr, dev_turn_addr);
        if (st) return st;
    }

    return 0;
}

/*
HPS가 DONE 토큰을 기록할 때까지 기다리는 함수.
핸드셰이크 블록을 반복적으로 읽어 오면서 DONE 위치의 값이 지정한 token과 일치하는지 확인한다.
*/
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
            return 0;
        }

        if (poll_sleep_us) usleep(poll_sleep_us);
    }

    return -ETIMEDOUT;
}

/*
HPS에게 결과 재확인 요청을 보내는 함수.
현재 핸드셰이크 블록을 읽은 뒤 REFRESH_REQ를 token으로 세팅하고 REFRESH_ACK는 0으로 초기화한다.
*/
static int host_request_hps_result_refresh(dma_ctx_t *ctx,
                                           uint64_t dev_hs_base,
                                           uint32_t token)
{
    int st = 0;
    uint32_t rd[HS_XFER_WORDS] = {0};

    st = d2h_read_buf(ctx, rd, dev_hs_base, HS_XFER_BYTES);
    if (st) return st;

    rd[HS_REFRESH_REQ_WORD_IDX] = token;
    rd[HS_REFRESH_ACK_WORD_IDX] = 0u;

    st = h2d_write_buf(ctx, dev_hs_base, rd, HS_XFER_BYTES);
    if (st) return st;

    return 0;
}

/*
HPS가 refresh 요청을 처리한 뒤 ACK를 올릴 때까지 기다리는 함수.
핸드셰이크 블록을 반복적으로 읽으면서 REFRESH_ACK 위치가 token과 같아지는 시점을 확인한다.
*/
static int host_wait_hps_refresh_ack(dma_ctx_t *ctx,
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

        if (rd[HS_REFRESH_ACK_WORD_IDX] == token) {
            return 0;
        }

        if (poll_sleep_us) usleep(poll_sleep_us);
    }

    return -ETIMEDOUT;
}

/*
DONE 및 refresh 관련 플래그를 정리하는 함수.
현재 핸드셰이크 블록을 읽은 뒤 DONE, REFRESH_REQ, REFRESH_ACK 항목을 모두 0으로 만들어 다음 실행을 준비한다.
*/
static int host_clear_hps_done(dma_ctx_t *ctx, uint64_t dev_hs_base)
{
    int st = 0;
    uint32_t rd[HS_XFER_WORDS] = {0};

    st = d2h_read_buf(ctx, rd, dev_hs_base, HS_XFER_BYTES);
    if (st) return st;

    rd[HS_DONE_WORD_IDX]        = 0u;
    rd[HS_REFRESH_REQ_WORD_IDX] = 0u;
    rd[HS_REFRESH_ACK_WORD_IDX] = 0u;

    st = h2d_write_buf(ctx, dev_hs_base, rd, HS_XFER_BYTES);
    if (st) return st;

    return 0;
}

/*
프로그램 사용법을 출력하는 함수.
명령행 옵션으로 설정 가능한 increment 횟수와 PCI BDF 인자 형식을 사용자에게 보여준다.
*/
static void print_usage(const char *prog)
{
    printf("Usage: %s [-n inc_count] [-b BDF]\n", prog);
    printf("  -n inc_count   Host increment count (default: %u)\n", DEFAULT_HOST_INC_COUNT);
    printf("  -b BDF         PCI BDF (default: 0000:41:00.0)\n");
}

/*
메인 함수.
명령행 인자를 해석하고 VFIO/DMA 버퍼를 초기화한 뒤, 핸드셰이크, atomic increment, DONE 대기, refresh 요청, 최종 결과 확인까지 전체 흐름을 수행한다.
*/
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

    st = alloc_dma_buffers(&ctx, 4096, 4096, 4096);
    if (st) {
        printf("alloc_dma_buffers failed: %d\n", st);
        cleanup(&ctx);
        return 1;
    }

    printf("IOVA(desc) = 0x%016" PRIx64 "\n", ctx.desc_iova);
    printf("IOVA(tx)   = 0x%016" PRIx64 "\n", ctx.tx_iova);
    printf("IOVA(rx)   = 0x%016" PRIx64 "\n", ctx.rx_iova);

    const uint32_t token = 0xA5A50001u;

    printf("Handshake start: hs_base=0x%016" PRIx64 ", token=0x%08x\n",
           (uint64_t)DEV_HS_BASE, token);

    st = host_barrier_handshake_dma(&ctx,
                                    DEV_COUNTER_ADDR,
                                    DEV_HS_BASE,
                                    DEV_LOCK_HOST_ADDR,
                                    DEV_LOCK_DEV_ADDR,
                                    DEV_TURN_ADDR,
                                    token,
                                    /*poll_limit=*/5000u,
                                    /*poll_sleep_us=*/1000u);
    if (st) {
        printf("handshake failed: %d\n", st);
        cleanup(&ctx);
        return 2;
    }

    printf("Handshake OK (GO sent). Start HOST atomic increment: %u times\n", host_inc_count);

    st = host_increment_n_times_atomic(&ctx,
                                       DEV_COUNTER_ADDR,
                                       DEV_LOCK_HOST_ADDR,
                                       DEV_LOCK_DEV_ADDR,
                                       DEV_TURN_ADDR,
                                       host_inc_count);
    if (st) {
        printf("host atomic increment failed: %d\n", st);
        cleanup(&ctx);
        return 3;
    }

    printf("HOST atomic increment done.\n");

    st = host_wait_hps_done(&ctx, DEV_HS_BASE, token,
                            /*poll_limit=*/5000u,
                            /*poll_sleep_us=*/1000u);
    if (st) {
        printf("wait HPS done failed: %d\n", st);
        cleanup(&ctx);
        return 4;
    }
    printf("HPS done detected.\n");

    st = host_request_hps_result_refresh(&ctx, DEV_HS_BASE, token);
    if (st) {
        printf("request HPS result refresh failed: %d\n", st);
        cleanup(&ctx);
        return 5;
    }
    printf("HPS result refresh request sent.\n");

    st = host_wait_hps_refresh_ack(&ctx, DEV_HS_BASE, token,
                                   /*poll_limit=*/5000u,
                                   /*poll_sleep_us=*/1000u);
    if (st) {
        printf("wait HPS refresh ack failed: %d\n", st);
        cleanup(&ctx);
        return 6;
    }
    printf("HPS result refresh ACK detected.\n");

    uint32_t final = 0u;
    st = read_u32_block(&ctx, DEV_COUNTER_ADDR, &final);
    if (st) {
        printf("final counter read failed: %d\n", st);
        cleanup(&ctx);
        return 7;
    }
    printf("FINAL counter = 0x%08x (result : %u)\n", final, final);

    st = host_clear_hps_done(&ctx, DEV_HS_BASE);
    if (st) {
        printf("clear HPS done/refresh flags failed: %d\n", st);
        cleanup(&ctx);
        return 8;
    }
    printf("HPS done/refresh flags cleared.\n");

    cleanup(&ctx);
    return 0;
}
