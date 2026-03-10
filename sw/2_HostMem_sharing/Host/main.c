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

// Shared buffer의 시작 IOVA 주소 + 크기
#define SHARED_IOVA_BASE   (0x01000000ull)
#define SHARED_BYTES       (2ull * 1024ull * 1024ull)

// debug 출력용 HPS H2F base 주소
#define HPS_H2F_BASE       (0x80000000ull)

// Shared buffer 내부 offset 배치
#define COUNTER_OFF        (0x00000000u) // 공유 counter 저장 위치
#define HS_BASE_OFF        (0x00100000u) // handshake / lock 변수들의 base offset

#define HS_REQ_OFF         (HS_BASE_OFF + 0x00u) // HPS -> Host 요청
#define HS_ACK_OFF         (HS_BASE_OFF + 0x04u) // Host -> HPS 요청 확인
#define HS_GO_OFF          (HS_BASE_OFF + 0x08u) // HPS -> Host 시작 허가
#define HS_DONE_OFF        (HS_BASE_OFF + 0x0Cu) // HPS -> Host 작업 완료 알림 

// Peterson lock vars
#define LOCK_HOST_OFF      (HS_BASE_OFF + 0x20u) // Host 측 진입 의사 flag
#define LOCK_DEV_OFF       (HS_BASE_OFF + 0x40u) // HPS 측 진입 의사 flag
#define TURN_OFF           (HS_BASE_OFF + 0x60u) // 동시 진입 시 우선순위 정보

#define TURN_HOST          (0u) // Host 우선
#define TURN_DEV           (1u) // HPS 우선

// Host가 수행할 기본 increment 횟수
#define DEFAULT_HOST_INC_COUNT  (5000u)

// shared buffer의 flag/counter를 host와 HPS가 함께 사용 중이므로, CPU/컴파일러의 메모리 재배치를 방지하여 접근 순서를 보장
static inline void host_fence(void)
{
    atomic_thread_fence(memory_order_seq_cst);
}

// shared buffer의 base VA + offset을 32bit 포인터로 변환
// offset이 전부 4B aligned되어 있기 때문에, 32-bit flag/counter word로 접근 가능
static inline volatile uint32_t *shm_u32_ptr(uint8_t *base, uint32_t off)
{
    return (volatile uint32_t *)(void *)(base + off);
}


static int wait_u32_eq(volatile uint32_t *p,
                       uint32_t expected,
                       uint32_t poll_limit,
                       uint32_t poll_sleep_us)
// shared buffer 내 shared flag의 값이 expected가 될 때까지 polling (HPS의 writing을 기다림)
{
    for (uint32_t i = 0; (poll_limit == 0u) || (i < poll_limit); ++i) { // poll_limit이 0이면 무한 대기
        if (*p == expected) {
            host_fence();
            return 0;
        }
        if (poll_sleep_us) usleep(poll_sleep_us); //poll_sleep_us로 대기 강도를 조절
    }
    return -ETIMEDOUT;
}

// 플래그/변수 초기화 
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

// 호스트는 HPS가 REQ=token을 쓸 때까지 기다리고, 이를 확인하면 ACK=token을 기록
// 이후 HPS가 GO-token을 쓸 때까지 다시 대기 (token = flag에 기록해 서로의 동작을 확인하는 비교용 값)
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

// Host 측 Peterson lock 진입
static inline void peterson_lock_host(uint8_t *shared_va)
{
    volatile uint32_t * const flag_self  = shm_u32_ptr(shared_va, LOCK_HOST_OFF);
    volatile uint32_t * const flag_other = shm_u32_ptr(shared_va, LOCK_DEV_OFF);
    volatile uint32_t * const turn       = shm_u32_ptr(shared_va, TURN_OFF);

    *flag_self = 1u; // LOCK_HOST 1로 올리고 (section 진입 희망)
    host_fence();

    *turn = TURN_DEV; // Device로 TURN을 넘김 (Host/HPS 동시 진입 희망 시 HPS에게 우선권을 줌)
    host_fence();

    while ((*flag_other != 0u) && (*turn == TURN_DEV)) { // HPS 진입 희망 + 우선권이 HPS에게 있으면 기다림 
        // spin
    }

    host_fence();
}

// 해당 함수를 통해 상대방이 더 이상 Host가 section 진입을 희망하지 않는 것으로 판단 
static inline void peterson_unlock_host(uint8_t *shared_va)
{
    volatile uint32_t * const flag_self = shm_u32_ptr(shared_va, LOCK_HOST_OFF);

    *flag_self = 0u; // section 진입 미희망(사용 끝)
    host_fence(); //메모리 순서 정리
}

// shared counter 증가를 n번 반복
// 매 증가마다 Peterson lock으로 보호하여 동시 접근 시 atomic 특성 보존
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

// HPS의 완료 신호(DONE=token)를 기다렸다가 이를 확인하면 reset 동작 수행 
static int host_wait_done_and_clear(uint8_t *shared_va,
                                    uint32_t token,
                                    uint32_t poll_limit,
                                    uint32_t poll_sleep_us)
{
    volatile uint32_t * const done = shm_u32_ptr(shared_va, HS_DONE_OFF); // DONE flag 위치의 포인터

    int st = wait_u32_eq(done, token, poll_limit, poll_sleep_us); // HPS가 작업을 끝내고 DONE=token을 기록할 때까지 대기
    if (st) return st;

    *done = 0u; // DONE 신호 확인 후 flag 초기화
    host_fence(); // 메모리 반영 순서 보장
    return 0;
}

// 디바이스 핸들(dev)을 닫기 전 할당한 메모리(RX/TX/Desc/Shared)가 있으면 해제
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

// 디버깅용 출력 함수
static void print_usage(const char *prog)
{
    printf("Usage: %s [-n inc_count] [-b BDF]\n", prog);
    printf("  -n inc_count   Host increment count (default: %u)\n", DEFAULT_HOST_INC_COUNT);
    printf("  -b BDF         PCI BDF (default: 0000:41:00.0)\n");
}

// Host 측 실행 진입 : 초기화 - Handshake(with HPS) - shared counter increment(atomic) - 결과 확인 및 종료
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
            if (*optarg == '\0' || (endp && *endp != '\0') || v > 0xFFFFFFFFul) { //숫자 유효성 검사
                fprintf(stderr, "Invalid -n value: %s\n", optarg);
                print_usage(argv[0]);
                return 1;
            }
            host_inc_count = (uint32_t)v; // 검사 후 host의 increment 횟수를 저장
            break;
        }
        case 'b': // -b 옵션으로 대상 PCIe 디바이스 주소(=BDF)를 직접 지정한 경우
            bdf = optarg; // 문자열 저장 (dma.lib의 init_vifo 함수에서 해당 bdfㄹ PCIe 디바이스 접근)
            break;
        case 'h': // 도움말 출력 옵션 
        default:
            print_usage(argv[0]);
            return 0;
        }
    }

    // DMA/VFIO 공통 context를 0으로 초기화하고, 아직 할당되지 않은 memid는 -1으로 설정
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

    // Host/HPS 공용 shared buffer를 alloc + 해당 buffer의 VA와 IOVA 할당
    st = alloc_shared_buffer(&ctx, (size_t)SHARED_BYTES, SHARED_IOVA_BASE);
    if (st) {
        printf("alloc_shared_buffer failed: %d\n", st);
        cleanup_all(&ctx);
        return 1;
    }
    // shared buffer 초기화 + 순서 보장(fence)
    memset(ctx.shared_va, 0, ctx.shared_bytes);
    host_fence();
    // counter/flag 변수 초기화
    host_prepare_shared_state(ctx.shared_va);
    // Host가 보는 shared buffer의 VA/IOVA/크기를 출력 (매핑 상태 확인 목적)
    printf("[shared] VA   = %p\n", (void *)ctx.shared_va);
    printf("[shared] IOVA = 0x%016" PRIx64 " (requested 0x%016" PRIx64 ")\n",
           ctx.shared_iova, (uint64_t)SHARED_IOVA_BASE);
    printf("[shared] size = 0x%zx bytes\n", ctx.shared_bytes);
    // counter/handshake 기준 주소를 계산 및 출력
    const uint64_t hps_target_addr = HPS_H2F_BASE + ctx.shared_iova + COUNTER_OFF;
    const uint64_t hps_hs_base     = HPS_H2F_BASE + ctx.shared_iova + HS_BASE_OFF;
    printf("[HPS] TARGET_ADDR should be 0x%016" PRIx64 "\n", hps_target_addr);
    printf("[HPS] HS_BASE     should be 0x%016" PRIx64 "\n", hps_hs_base);
    // Host와 Device/HPS가 공유할 handshake token을 정의 
    const uint32_t token = 0xA5A50001u;
    // Device/HPS가 REQ를 기록할 때까지 대기 + 안내 메시지 출력
    printf("\nHOST is ready. Waiting for DEVICE REQ(token=0x%08x)...\n", token);
    printf("(Run device/HPS program now)\n\n");

    // REQ 대기 -> ACK 기록 -> GO 대기 순서로 시작 handshake를 수행
    st = host_wait_req_ack_wait_go(ctx.shared_va, token,
                                   /*poll_limit=*/0u,
                                   /*poll_sleep_us=*/1000u);
    if (st) {
        printf("handshake(wait-req/ack/wait-go) failed: %d\n", st);
        cleanup_all(&ctx);
        return 2;
    }
    // handshake가 완료되면 Host 측 atomic increment를 시작
    printf("Handshake OK (GO seen). Start HOST atomic increment: %u times\n", host_inc_count);

    st = host_increment_n_times_shared_atomic(ctx.shared_va, host_inc_count);
    if (st) {
        printf("host atomic increment failed: %d\n", st);
        cleanup_all(&ctx);
        return 3;
    }
    // Host 작업이 끝나면 Device/HPS의 완료 신호를 기다림
    printf("HOST atomic increment done. Waiting DEVICE DONE(token)...\n");

    st = host_wait_done_and_clear(ctx.shared_va, token,
                                  /*poll_limit=*/0u,
                                  /*poll_sleep_us=*/1000u);
    if (st) {
        printf("wait DONE failed: %d\n", st);
        cleanup_all(&ctx);
        return 4;
    }
    // shared counter의 최종 값을 읽어 이번 Host/HPS 공동 수행 결과를 확인
    volatile uint32_t * const counter = shm_u32_ptr(ctx.shared_va, COUNTER_OFF);
    uint32_t final = *counter;
    host_fence();

    printf("DONE seen+cleared. FINAL counter = 0x%08x (%u)\n", final, final);

    // shared state를 정리
    *shm_u32_ptr(ctx.shared_va, HS_REQ_OFF)    = 0u;
    *shm_u32_ptr(ctx.shared_va, HS_ACK_OFF)    = 0u;
    *shm_u32_ptr(ctx.shared_va, HS_GO_OFF)     = 0u;
    *shm_u32_ptr(ctx.shared_va, LOCK_HOST_OFF) = 0u;
    *shm_u32_ptr(ctx.shared_va, LOCK_DEV_OFF)  = 0u;
    *shm_u32_ptr(ctx.shared_va, TURN_OFF)      = TURN_HOST;
    host_fence();
    // 할당한 shared/VFIO 자원을 정리
    cleanup_all(&ctx);
    return 0;
}