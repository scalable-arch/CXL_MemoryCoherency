/*
Explanation
이 코드는 호스트 측에서 DMA를 사용해 device memory 기반 atomic increment 동작을 수행하는 코드이다.
호스트와 HPS는 DEV_COUNTER_ADDR의 counter를 함께 사용하며, DEV_HS_BASE 아래의 핸드셰이크 영역과 lock 변수를 통해 실행 순서와 상호 배제를 맞춘다.
프로그램은 먼저 VFIO를 통해 FPGA 디바이스를 열고, descriptor ring과 TX/RX buffer를 포함한 DMA용 Host buffer를 할당한다.
이후 device memory의 counter와 lock 상태를 초기화하고, REQ/ACK/GO 기반 barrier handshake를 통해 HPS와 시작 시점을 맞춘다.
그 다음 호스트는 Dekker mutex를 사용해 HPS와 상호 배제를 보장하면서 device memory counter를 host_inc_count 횟수만큼 증가시킨다.
증가 작업이 끝나면 HPS가 DONE 토큰을 기록할 때까지 기다린 뒤 최종 counter 값을 다시 읽어 결과를 확인한다.
마지막으로 DONE 값을 clear하고 DMA/VFIO 자원을 정리한 뒤 종료한다.
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

#define HS_XFER_WORDS          (8u)
#define HS_XFER_BYTES          (32u)   // handshake 전송 블록 단위: 32B
#define HS_DONE_WORD_IDX       (3u)

#define DEFAULT_HOST_INC_COUNT (500000u) // Host가 수행할 increment 횟수
#define COUNTER_XFER_BYTES     (32u) // counter 접근 블록 단위: 32B

 // Host DMA 기준 device memory map
#define DEV_COUNTER_ADDR       (0x00000000ull)         // counter  : 0x00000000
#define DEV_HS_BASE            (0x00100000ull)         // handshake: 0x00100000
#define DEV_LOCK_HOST_ADDR     (DEV_HS_BASE + 0x20ull) // lock_host: 0x00100020
#define DEV_LOCK_DEV_ADDR      (DEV_HS_BASE + 0x40ull) // lock_dev : 0x00100040
#define DEV_TURN_ADDR          (DEV_HS_BASE + 0x60ull) // turn     : 0x00100060

#define TURN_HOST              (0u) // Host 우선
#define TURN_DEV               (1u) // HPS 우선


// Host memory의 tx buffer 내용을 device memory(dst_dev_addr)로 DMA write
static int h2d_write_buf(dma_ctx_t *ctx, uint64_t dst_dev_addr, const void *src, uint32_t len)
{
    int st = 0;
    const uint32_t desc_idx = 1;

    if (!ctx || !src) return -1;
    if (len == 0 || len > DMA_LEN_MAX_BYTES) return -1;

    // H2D queue 초기화
    st = qcsr_init_queue(ctx, QCSR_DIR_H2D, QUEUE_ID, ctx->desc_iova, RING_ORDER_LOG2);
    if (st) return st;

    // Host memory(tx_va)에 전송할 payload 복사
    memcpy(ctx->tx_va, src, len);
    atomic_thread_fence(memory_order_release);

    // H2D descriptor 작성
    st = write_desc_h2d(ctx, desc_idx, dst_dev_addr, len);
    if (st) return st;

    // doorbell로 DMA 실행 시작
    st = doorbell(ctx, QCSR_DIR_H2D, QUEUE_ID, desc_idx);
    if (st) return st;

    // 해당 descriptor 완료까지 polling
    st = poll_complete(ctx, QCSR_DIR_H2D, QUEUE_ID, desc_idx, NULL);
    if (st) return st;

    return 0;
}

// device memory(src_dev_addr) 내용을 Host memory(rx_va)로 DMA read
static int d2h_read_buf(dma_ctx_t *ctx, void *dst, uint64_t src_dev_addr, uint32_t len)
{
    int st = 0;
    const uint32_t desc_idx = 1;

    if (!ctx || !dst) return -1;
    if (len == 0 || len > DMA_LEN_MAX_BYTES) return -1;

    // D2H queue 초기화
    st = qcsr_init_queue(ctx, QCSR_DIR_D2H, QUEUE_ID, ctx->desc_iova, RING_ORDER_LOG2);
    if (st) return st;

    // rx buffer를 비운 뒤 DMA read 준비
    memset(ctx->rx_va, 0x00, len);
    atomic_thread_fence(memory_order_release);

    // D2H descriptor 작성
    st = write_desc_d2h(ctx, desc_idx, src_dev_addr, len);
    if (st) return st;

    // doorbell로 DMA 실행 시작
    st = doorbell(ctx, QCSR_DIR_D2H, QUEUE_ID, desc_idx);
    if (st) return st;

    // 해당 descriptor 완료까지 polling
    st = poll_complete(ctx, QCSR_DIR_D2H, QUEUE_ID, desc_idx, NULL);
    if (st) return st;

    // DMA로 읽어온 내용을 caller buffer로 복사
    memcpy(dst, ctx->rx_va, len);
    return 0;
}

// 32B block write helper (using word0)
static int write_u32_block(dma_ctx_t *ctx, uint64_t dev_addr, uint32_t value)
{
    uint32_t wr[HS_XFER_WORDS] = {0};
    wr[0] = value;
    return h2d_write_buf(ctx, dev_addr, wr, HS_XFER_BYTES);
}

// 32B block read helper (word0만 읽어 caller에게 반환)
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

// atomic increment 시작 전 counter / lock / turn 상태 초기화
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

// Host가 device memory의 handshake block(=디바이스 메모리 공간)을 통해 barrier handshake 수행
// REQ=token 기록 -> ACK 확인 -> GO=token 기록 순서로 동작
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

    // handshake 시작 전 counter + mutex 상태 초기화
    st = host_prepare_atomic_state(ctx,
                                   dev_counter_addr,
                                   dev_lock_host_addr,
                                   dev_lock_dev_addr,
                                   dev_turn_addr);
    if (st) return st;

    // device memory에 토큰/state 기록
    wr[0] = token;  // REQ
    wr[1] = 0u;     // ACK
    wr[2] = 0u;     // GO
    wr[3] = 0u;     // DONE
    st = h2d_write_buf(ctx, dev_hs_base, wr, HS_XFER_BYTES);
    if (st) return st;

    // 상대가 ACK=token을 기록할 때까지 polling
    for (uint32_t i = 0; i < poll_limit; ++i) {
        st = d2h_read_buf(ctx, rd, dev_hs_base, HS_XFER_BYTES);
        if (st) return st;

        if (rd[1] == token) break;
        if (poll_sleep_us) usleep(poll_sleep_us);
    }
    if (rd[1] != token) return -ETIMEDOUT;

    // ACK 확인 후 GO=token을 기록: 시작 허가
    wr[0] = token;
    wr[1] = token;
    wr[2] = token;
    wr[3] = 0u;
    st = h2d_write_buf(ctx, dev_hs_base, wr, HS_XFER_BYTES);
    if (st) return st;

    // GO write가 정상 반영되었는지 readback으로 확인
    st = d2h_read_buf(ctx, rd, dev_hs_base, HS_XFER_BYTES);
    if (st) return st;
    if (rd[2] != token) return -EIO;

    return 0;
}

// Host 측 Dekker lock 진입
static int host_dekker_lock(dma_ctx_t *ctx,
                            uint64_t dev_lock_host_addr,
                            uint64_t dev_lock_dev_addr,
                            uint64_t dev_turn_addr)
{
    int st = 0;
    uint32_t other = 0u;
    uint32_t turn  = 0u;

    // LOCK_HOST를 1로 올리고 section 진입 의사 표시
    st = write_u32_block(ctx, dev_lock_host_addr, 1u);
    if (st) return st;

    for (;;) {
        // 상대(HPS)의 진입 의사 확인
        st = read_u32_block(ctx, dev_lock_dev_addr, &other);
        if (st) return st;

        // 상대가 진입을 원하지 않으면 바로 진입
        if (other == 0u) {
            return 0;
        }

        // turn 값으로 현재 우선권 확인
        st = read_u32_block(ctx, dev_turn_addr, &turn);
        if (st) return st;

        // 우선권이 상대에게 있으면 잠시 자신의 flag를 내리고 turn이 바뀔 때까지 대기
        if (turn == TURN_DEV) {
            st = write_u32_block(ctx, dev_lock_host_addr, 0u);
            if (st) return st;

            do {
                st = read_u32_block(ctx, dev_turn_addr, &turn);
                if (st) return st;
            } while (turn == TURN_DEV);

        // 우선권이 돌아오면 다시 진입 의사 표시
            st = write_u32_block(ctx, dev_lock_host_addr, 1u);
            if (st) return st;
        }
    }
}
// Host 측 Dekker lock 해제
static int host_dekker_unlock(dma_ctx_t *ctx,
                              uint64_t dev_lock_host_addr,
                              uint64_t dev_turn_addr)
{
    int st = 0;
    // 다음 충돌 시 상대에게 우선권을 넘김
    st = write_u32_block(ctx, dev_turn_addr, TURN_DEV);
    if (st) return st;
    // 자신의 진입 의사를 철회
    st = write_u32_block(ctx, dev_lock_host_addr, 0u);
    if (st) return st;

    return 0;
}

// shared counter 역할의 device memory counter를 n번 증가
// 매 증가마다 Dekker lock으로 보호하여 동시 접근 시 atomic 특성 보존
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
// Device/HPS가 DONE=token을 기록할 때까지 handshake block을 polling
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
// DONE 확인 후 handshake block의 DONE word를 0으로 clear
static int host_clear_hps_done(dma_ctx_t *ctx, uint64_t dev_hs_base)
{
    int st = 0;
    uint32_t rd[HS_XFER_WORDS] = {0};

    st = d2h_read_buf(ctx, rd, dev_hs_base, HS_XFER_BYTES);
    if (st) return st;

    rd[HS_DONE_WORD_IDX] = 0u;

    st = h2d_write_buf(ctx, dev_hs_base, rd, HS_XFER_BYTES);
    if (st) return st;

    return 0;
}
// 디버깅용 출력 함수
static void print_usage(const char *prog)
{
    printf("Usage: %s [-n inc_count] [-b BDF]\n", prog);
    printf("  -n inc_count   Host increment count (default: %u)\n", DEFAULT_HOST_INC_COUNT);
    printf("  -b BDF         PCI BDF (default: 0000:41:00.0)\n");
}

// Host 측 실행 진입 : 초기화 - Handshake(with Device/HPS) - device memory counter increment(atomic) - 결과 확인 및 종료
int main(int argc, char **argv)
{
    const char *bdf = "0000:41:00.0";
    uint32_t host_inc_count = DEFAULT_HOST_INC_COUNT;

    int opt = 0;
    while ((opt = getopt(argc, argv, "n:b:h")) != -1) {
        switch (opt) {
        case 'n': { // -n 옵션으로 전달된 Host increment 횟수를 파싱하고 검증
            char *endp = NULL;
            unsigned long v = strtoul(optarg, &endp, 0);
            if (*optarg == '\0' || (endp && *endp != '\0') || v > 0xFFFFFFFFul) {
                fprintf(stderr, "Invalid -n value: %s\n", optarg);
                print_usage(argv[0]);
                return 1;
            }
            host_inc_count = (uint32_t)v; // 검사 후 Host increment 횟수 저장
            break;
        }
        case 'b': // -b 옵션으로 대상 PCIe 디바이스 주소(=BDF)를 직접 지정
            bdf = optarg;
            break;
        case 'h': // 도움말 출력 옵션
        default:
            print_usage(argv[0]);
            return 0;
        }
    }
    // DMA/VFIO 공통 context를 0으로 초기화하고, 아직 할당되지 않은 memid는 -1로 설정
    dma_ctx_t ctx = (dma_ctx_t){0};
    ctx.desc_memid   = -1;
    ctx.tx_memid     = -1;
    ctx.rx_memid     = -1;
    ctx.shared_memid = -1;
    // VFIO를 초기화하여 대상 FPGA 디바이스를 열고 userspace 접근 준비
    int st = init_vfio(&ctx, bdf);
    if (st) {
        printf("init_vfio failed: %d\n", st);
        return 1;
    }
    // DMA용 desc / tx / rx buffer를 할당하고 각 buffer의 VA/IOVA를 준비
    st = alloc_dma_buffers(&ctx, 4096, 4096, 4096);
    if (st) {
        printf("alloc_dma_buffers failed: %d\n", st);
        cleanup(&ctx);
        return 1;
    }
    // 현재 할당된 DMA buffer의 IOVA를 출력
    printf("IOVA(desc) = 0x%016" PRIx64 "\n", ctx.desc_iova);
    printf("IOVA(tx)   = 0x%016" PRIx64 "\n", ctx.tx_iova);
    printf("IOVA(rx)   = 0x%016" PRIx64 "\n", ctx.rx_iova);

    // 이번 실행에서 Host와 Device/HPS가 공유할 handshake token 정의
    const uint32_t token = 0xA5A50001u;

    // handshake 시작 정보 출력
    printf("Handshake start: hs_base=0x%016" PRIx64 ", token=0x%08x\n",
           DEV_HS_BASE, token);

    // counter / lock 상태 초기화 후 REQ 기록 -> ACK 대기 -> GO 기록 순서로 handshake 수행
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
    // handshake가 완료되었으므로 Host 측 atomic increment 시작
    printf("Handshake OK (GO sent). Start HOST atomic increment: %u times\n", host_inc_count);

    // device memory의 counter를 n회 증가시키며, 각 증가 연산은 Dekker lock으로 보호
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
    // Host 작업 완료 후 Device/HPS의 완료 신호를 기다림
    printf("HOST atomic increment done.\n");

    // Device/HPS가 DONE=token을 기록할 때까지 polling
    st = host_wait_hps_done(&ctx, DEV_HS_BASE, token,
                            /*poll_limit=*/5000u,
                            /*poll_sleep_us=*/1000u);
    if (st) {
        printf("wait HPS done failed: %d\n", st);
        cleanup(&ctx);
        return 4;
    }

    printf("HPS done detected.\n");

    // 최종 counter 값을 device memory에서 읽어 결과 확인
    uint32_t final = 0u;
    st = read_u32_block(&ctx, DEV_COUNTER_ADDR, &final);
    if (st) {
        printf("final counter read failed: %d\n", st);
        cleanup(&ctx);
        return 5;
    }

    printf("FINAL counter = 0x%08x (%u)\n", final, final);

    // DONE flag를 clear하여 다음 실행에 이전 완료 상태가 남지 않도록 정리
    st = host_clear_hps_done(&ctx, DEV_HS_BASE);
    if (st) {
        printf("clear HPS done failed: %d\n", st);
        cleanup(&ctx);
        return 6;
    }

    printf("HPS done cleared.\n");

    // 할당한 DMA/VFIO 자원을 정리하고 정상 종료
    cleanup(&ctx);
    return 0;
}