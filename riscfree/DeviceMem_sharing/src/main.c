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

#define TARGET_ADDR          ((uintptr_t)0x90000000u)
#define HS_BASE              ((uintptr_t)0x90100000u)

#define HS_REQ_ADDR          (HS_BASE + 0x0u)
#define HS_ACK_ADDR          (HS_BASE + 0x4u)
#define HS_GO_ADDR           (HS_BASE + 0x8u)
#define HS_DONE_ADDR         (HS_BASE + 0xCu)
#define HS_REFRESH_REQ_ADDR  (HS_BASE + 0x10u)
#define HS_REFRESH_ACK_ADDR  (HS_BASE + 0x14u)

/*
 * IMPORTANT:
 * Host side updates memory in 32B DMA blocks.
 * So each shared sync variable gets its OWN 32B block.
 */
#define LOCK_HOST_ADDR       (HS_BASE + 0x20u)   // host flag block
#define LOCK_DEV_ADDR        (HS_BASE + 0x40u)   // device flag block
#define TURN_ADDR            (HS_BASE + 0x60u)   // turn block

#define TURN_HOST            (0u)
#define TURN_DEV             (1u)

#define LIMIT                (50000u)

/*
I/O 메모리 접근 순서를 보장하는 fence 함수.
아키텍처별 적절한 메모리 배리어를 사용해 공유 레지스터와 counter 접근이 순서대로 보이도록 만든다.
*/
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

/*
호스트와의 시작 핸드셰이크를 수행하는 함수.
DONE 및 refresh 관련 상태를 초기화한 뒤, 호스트의 REQ를 기다리고 ACK를 반환한 다음 GO를 기다린다.
*/
static bool barrier_handshake(uint32_t token, uint32_t spin_limit)
{
    volatile uint32_t * const req         = (volatile uint32_t *)HS_REQ_ADDR;
    volatile uint32_t * const ack         = (volatile uint32_t *)HS_ACK_ADDR;
    volatile uint32_t * const go          = (volatile uint32_t *)HS_GO_ADDR;
    volatile uint32_t * const done        = (volatile uint32_t *)HS_DONE_ADDR;
    volatile uint32_t * const refresh_req = (volatile uint32_t *)HS_REFRESH_REQ_ADDR;
    volatile uint32_t * const refresh_ack = (volatile uint32_t *)HS_REFRESH_ACK_ADDR;
    volatile uint32_t * const myflag      = (volatile uint32_t *)LOCK_DEV_ADDR;

    // 이번 실행용 초기화
    *done        = 0u;
    *refresh_req = 0u;
    *refresh_ack = 0u;
    *myflag      = 0u;
    io_fence();

    bool req_seen = false;

    // Host REQ 대기
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

    // Host GO 대기
    for (uint32_t spin = 0; spin < spin_limit; ++spin) {
        if (*go == token) {
            io_fence();
            return true;
        }
    }

    return false;
}


/*
디바이스 측 Dekker lock 획득 함수.
자신의 진입 의사를 표시한 뒤, 호스트가 이미 진입을 원하면 turn 값을 보며 양보와 재시도를 반복한다.
*/
static void dekker_lock_device(void)
{
    volatile uint32_t * const flag_self  = (volatile uint32_t *)LOCK_DEV_ADDR;
    volatile uint32_t * const flag_other = (volatile uint32_t *)LOCK_HOST_ADDR;
    volatile uint32_t * const turn       = (volatile uint32_t *)TURN_ADDR;

    *flag_self = 1u;
    io_fence();

    while (*flag_other != 0u) {
        if (*turn == TURN_HOST) {
            *flag_self = 0u;
            io_fence();

            while (*turn == TURN_HOST) {
                // spin
            }

            *flag_self = 1u;
            io_fence();
        }
    }

    io_fence();
}

/*
디바이스 측 Dekker lock 해제 함수.
turn을 호스트 쪽으로 넘기고 자신의 flag를 내려 임계 구역 사용 종료를 알린다.
*/
static void dekker_unlock_device(void)
{
    volatile uint32_t * const flag_self = (volatile uint32_t *)LOCK_DEV_ADDR;
    volatile uint32_t * const turn      = (volatile uint32_t *)TURN_ADDR;

    *turn = TURN_HOST;
    io_fence();

    *flag_self = 0u;
    io_fence();
}

/*
counter를 한 번 읽어 오는 함수.
TARGET_ADDR를 직접 읽기 전후에 fence를 수행하여 다른 쪽 코어와의 메모리 관측 순서를 안정적으로 맞춘다.
*/
static uint32_t read_counter_once(void)
{
    volatile uint32_t * const p = (volatile uint32_t *)TARGET_ADDR;
    uint32_t v = 0u;

    io_fence();
    v = *p;
    io_fence();

    return v;
}

/*
디바이스 측 atomic increment 본체 함수.
Dekker lock으로 임계 구역을 보호하면서 counter를 LIMIT 횟수만큼 증가시키고 마지막 값을 읽어 반환한다.
*/
static uint32_t do_increment_atomic(void)
{
    volatile uint32_t * const p = (volatile uint32_t *)TARGET_ADDR;

    for (uint32_t i = 0; i < LIMIT; ++i) {
        dekker_lock_device();

        uint32_t v = *p;
        v = v + 1u;
        *p = v;
        io_fence();

        dekker_unlock_device();
    }

    return read_counter_once();
}

/*
호스트의 결과 재확인 요청을 기다리는 함수.
호스트가 모든 작업을 마친 뒤 REFRESH_REQ에 token을 쓸 때까지 계속 polling 하며 대기한다.
*/
static void wait_host_refresh_request(uint32_t token)
{
    volatile uint32_t * const refresh_req = (volatile uint32_t *)HS_REFRESH_REQ_ADDR;

    while (*refresh_req != token) {
        // host cpu가 끝났다는 신호를 기다림
    }

    io_fence();
}

/*
호스트에게 refresh 처리 완료 ACK를 보내는 함수.
디바이스가 counter를 다시 읽어 result를 최신화했음을 REFRESH_ACK 레지스터에 token을 써서 알린다.
*/
static void send_refresh_ack(uint32_t token)
{
    volatile uint32_t * const refresh_ack = (volatile uint32_t *)HS_REFRESH_ACK_ADDR;

    io_fence();
    *refresh_ack = token;
    io_fence();
}

/*
메인 함수.
초기 핸드셰이크를 수행하고 atomic increment를 실행한 뒤, DONE 토큰을 기록하고 호스트의 refresh 요청에 맞춰 result를 다시 갱신한다.
*/
int main(void)
{
    const uint32_t token = 0xA5A50001u;
    volatile int end = 0;
    volatile uint32_t result = 0u;
    volatile uint32_t * const done = (volatile uint32_t *)HS_DONE_ADDR;

    if (!barrier_handshake(token, 200000000u)) {
        return -1;
    }

    result = do_increment_atomic();

    io_fence();
    *done = token;
    io_fence();

    // host cpu가 다 끝난 뒤 다시 한번 counter를 읽어서 result를 최신화
    wait_host_refresh_request(token);
    result = read_counter_once();
    send_refresh_ack(token);

    end = 1;
    (void)result;
    (void)end;
    return 0;
}
