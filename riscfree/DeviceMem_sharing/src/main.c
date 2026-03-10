/*
Explanation
이 코드는 디바이스/HPS 측에서 공유 메모리 기반 atomic increment 동작을 수행하는 코드이다.
호스트와 디바이스는 TARGET_ADDR의 counter를 함께 사용하며, HS_BASE 아래의 핸드셰이크 레지스터로 실행 순서를 맞춘다.
프로그램은 먼저 REQ/ACK/GO 기반 barrier handshake를 통해 호스트가 준비되었는지 확인한 뒤 실제 작업을 시작한다.
이후 디바이스는 Dekker mutex를 사용해 호스트와 상호 배제를 보장하면서 counter를 LIMIT 횟수만큼 증가시킨다.
증가 작업이 끝나면 DONE 토큰을 기록해 디바이스 측 작업 완료를 호스트에 알린다.
그 다음 호스트가 모든 increment를 마친 뒤 보내는 refresh request를 기다렸다가 counter를 다시 읽어 result를 최신화한다.
마지막으로 refresh ACK를 반환하고 종료하여, 디바이스 측에서도 최종 counter 결과를 확인할 수 있게 한다.
*/

#include <stdint.h>
#include <stdbool.h>

// HPS에서 보는 device memory 주소
#define TARGET_ADDR          ((uintptr_t)0x90000000u)
#define HS_BASE              ((uintptr_t)0x90100000u)

#define HS_REQ_ADDR          (HS_BASE + 0x0u)
#define HS_ACK_ADDR          (HS_BASE + 0x4u)
#define HS_GO_ADDR           (HS_BASE + 0x8u)
#define HS_DONE_ADDR         (HS_BASE + 0xCu)
#define HS_REFRESH_REQ_ADDR  (HS_BASE + 0x10u)
#define HS_REFRESH_ACK_ADDR  (HS_BASE + 0x14u)

// 각 shared sync 변수는 서로 다른 32B block에 배치 (Host DMA는 device memory를 32B block 단위로 갱신)
#define LOCK_HOST_ADDR       (HS_BASE + 0x20u)   // host flag block
#define LOCK_DEV_ADDR        (HS_BASE + 0x40u)   // device flag block
#define TURN_ADDR            (HS_BASE + 0x60u)   // turn block

#define TURN_HOST            (0u)
#define TURN_DEV             (1u)

// HPS가 수행할 increment 횟수
#define LIMIT                (50000u)

// device memory의 flag/counter를 Host와 HPS가 함께 사용할 때, 메모리 접근 순서를 강하게 보장
static inline void io_fence(void)
{
#if defined(__riscv)
    __asm__ __volatile__("fence iorw, iorw" ::: "memory");
#elif defined(__aarch64__) || defined(__arm__)
    __asm__ __volatile__("dmb sy" ::: "memory");
#else
    __sync_synchronize();
#endif
}

// HPS 측 시작 handshake를 수행: Host의 REQ(token) 대기 -> ACK(token) 기록 -> Host의 GO(token) 대기
static bool barrier_handshake(uint32_t token, uint32_t spin_limit)
{
    volatile uint32_t * const req         = (volatile uint32_t *)HS_REQ_ADDR;
    volatile uint32_t * const ack         = (volatile uint32_t *)HS_ACK_ADDR;
    volatile uint32_t * const go          = (volatile uint32_t *)HS_GO_ADDR;
    volatile uint32_t * const done        = (volatile uint32_t *)HS_DONE_ADDR;
    volatile uint32_t * const refresh_req = (volatile uint32_t *)HS_REFRESH_REQ_ADDR;
    volatile uint32_t * const refresh_ack = (volatile uint32_t *)HS_REFRESH_ACK_ADDR;
    volatile uint32_t * const myflag      = (volatile uint32_t *)LOCK_DEV_ADDR;

    // status 초기화
    *done        = 0u;
    *refresh_req = 0u;
    *refresh_ack = 0u;
    *myflag      = 0u;
    io_fence();

    bool req_seen = false;

    // Host REQ(token) 대기 후 ACK(token) 기록 
    for (uint32_t spin = 0; spin < spin_limit; ++spin) {
        if (*req == token) {
            io_fence();
            *ack = token;
            io_fence();
            req_seen = true;
            break;
        }
    }

    if (!req_seen) {
        return false;
    }

    // Host의 GO(token) 대기
    for (uint32_t spin = 0; spin < spin_limit; ++spin) {
        if (*go == token) {
            io_fence();
            return true;
        }
    }

    return false;
}

// Device/HPS 측 Dekker software lock acquire 함수 : LOCK_DEV를 올린 뒤 Host와의 충돌 여부 확인 + turn 값에 따라 대기/재시도 반복
static void dekker_lock_device(void)
{
    volatile uint32_t * const flag_self  = (volatile uint32_t *)LOCK_DEV_ADDR;
    volatile uint32_t * const flag_other = (volatile uint32_t *)LOCK_HOST_ADDR;
    volatile uint32_t * const turn       = (volatile uint32_t *)TURN_ADDR;

    // HPS 진입 의사 표시
    *flag_self = 1u;
    io_fence();

    // Host가 진입 중이면 turn에 따라 양보
    while (*flag_other != 0u) {
        if (*turn == TURN_HOST) {
            // Host가 우선권 가질 시 진입 의사 철회
            *flag_self = 0u;
            io_fence();

            // turn이 바뀔 때까지 대기
            while (*turn == TURN_HOST) {
                // spin
            }

            *flag_self = 1u;
            io_fence();
        }
    }

    io_fence();
}

// HPS 측 Dekker software lock release 함수: turn을 Host로 넘기고 자신의 lock flag를 0으로 내려 Host가 이후 진입 가능하게 함
static void dekker_unlock_device(void)
{
    volatile uint32_t * const flag_self = (volatile uint32_t *)LOCK_DEV_ADDR;
    volatile uint32_t * const turn      = (volatile uint32_t *)TURN_ADDR;

    // 다음 충돌 시 Host에 우선권 부여
    *turn = TURN_HOST;
    io_fence();

    // HPS 진입 의사 철회
    *flag_self = 0u;
    io_fence();
}

// device memory의 counter를 한 번 읽어 현재 값을 반환(refresh 이후 최종 결과 확인에 사용)
static uint32_t read_counter_once(void)
{
    volatile uint32_t * const p = (volatile uint32_t *)TARGET_ADDR;
    uint32_t v = 0u;

    io_fence();
    v = *p;
    io_fence();

    return v;
}

// device memory의 counter를 LIMIT번 증가시키되, 매 증가마다 Dekker lock으로 보호
static uint32_t do_increment_atomic(void)
{
    volatile uint32_t * const p = (volatile uint32_t *)TARGET_ADDR;

    for (uint32_t i = 0; i < LIMIT; ++i) {
        dekker_lock_device();

        // counter read -> increment -> write
        uint32_t v = *p;
        v = v + 1u;
        *p = v;
        io_fence();

        dekker_unlock_device();
    }

    return read_counter_once();
}

// Host가 최종 결과 재확인을 요청하는 REFRESH_REQ(token)을 기록할 때까지 기다림 (최신 counter를 다시 읽기 위한 동기화)
static void wait_host_refresh_request(uint32_t token)
{
    volatile uint32_t * const refresh_req = (volatile uint32_t *)HS_REFRESH_REQ_ADDR;

    while (*refresh_req != token) {
        // Host CPU 완료 신호 대기
    }

    io_fence();
}

// REFRESH_REQ(token)을 확인한 뒤 REFRESH_ACK(token)을 기록
// HPS가 최종 counter refresh를 마쳤음을 Host에 알림
static void send_refresh_ack(uint32_t token)
{
    volatile uint32_t * const refresh_ack = (volatile uint32_t *)HS_REFRESH_ACK_ADDR;

    io_fence();
    *refresh_ack = token;
    io_fence();
}

// Host와 handshake 수행 --> device memory counter에 대한 atomic increment 실행 -->
// DONE(token) 기록 후 refresh 요청 수령 --> 최종 counter를 다시 읽고 ACK를 보낸 뒤 종료
int main(void)
{
    const uint32_t token = 0xA5A50001u;
    volatile int end = 0;
    volatile uint32_t result = 0u;
    volatile uint32_t * const done = (volatile uint32_t *)HS_DONE_ADDR;

    // 시작 handshake 수행 
    if (!barrier_handshake(token, 200000000u)) {
        return -1;
    }
    // HPS 측 atomic increment 수행
    result = do_increment_atomic();

    // DONE(token) 기록 
    io_fence();
    *done = token;
    io_fence();

    // Host 완료 후 refresh 요청을 받아 최종 counter 값을 다시 읽음 (값 최신화)
    wait_host_refresh_request(token);
    result = read_counter_once();
    
    // refresh 완료 ACK 전송
    send_refresh_ack(token);

    end = 1;
    (void)result;
    (void)end;
    return 0;
}
