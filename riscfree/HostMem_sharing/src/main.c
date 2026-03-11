/*
Explanation
이 코드는 디바이스/HPS 측에서 공유 메모리를 사용해 호스트와 동기화한 뒤, 공유 counter에 대해 atomic increment를 수행하는 코드이다.
프로그램은 먼저 handshake 영역의 REQ/ACK/GO/DONE 레지스터를 이용해 호스트와 실행 시작 시점을 맞추고, 시작 직전에 counter를 0으로 초기화한다.
그 다음 Peterson lock을 사용해 호스트와 상호 배제를 보장하면서 TARGET_ADDR의 counter를 LIMIT 횟수만큼 증가시킨다.
증가 작업이 끝나면 최종 값을 읽고 DONE 토큰을 기록해 디바이스 측 작업 완료를 호스트에 알린 뒤 프로그램을 종료한다.
*/

#include <stdint.h>
#include <stdbool.h>

// HPS에서 보는 shared memory 주소 
#define TARGET_ADDR      ((uintptr_t)0x81000000u)
#define HS_BASE          ((uintptr_t)0x81100000u)

#define HS_REQ_ADDR      (HS_BASE + 0x00u)
#define HS_ACK_ADDR      (HS_BASE + 0x04u)
#define HS_GO_ADDR       (HS_BASE + 0x08u)
#define HS_DONE_ADDR     (HS_BASE + 0x0Cu)

// Peterson lock 변수 
#define LOCK_HOST_ADDR   (HS_BASE + 0x20u)
#define LOCK_DEV_ADDR    (HS_BASE + 0x40u)
#define TURN_ADDR        (HS_BASE + 0x60u)

#define TURN_HOST        (0u)
#define TURN_DEV         (1u)

// Device/HPS가 수행할 increment 횟수
#define LIMIT            (50000u)

// shared memory의 flag/counter를 Host와 HPS가 함께 사용할 때 메모리 접근 순서를 보장
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

// Device/HPS 측 시작 handshake: REQ(token) 기록 -> Host ACK(token) 대기 -> counter 초기화 -> GO(token) 기록
static bool device_handshake_initiate(uint32_t token, uint32_t spin_limit)
{
    volatile uint32_t * const req      = (volatile uint32_t *)HS_REQ_ADDR;
    volatile uint32_t * const ack      = (volatile uint32_t *)HS_ACK_ADDR;
    volatile uint32_t * const go       = (volatile uint32_t *)HS_GO_ADDR;
    volatile uint32_t * const done     = (volatile uint32_t *)HS_DONE_ADDR;
    volatile uint32_t * const cnt      = (volatile uint32_t *)TARGET_ADDR;
    volatile uint32_t * const flag_dev = (volatile uint32_t *)LOCK_DEV_ADDR;

    // handshake / lock 상태 초기화
    *done     = 0u;
    *go       = 0u;
    *ack      = 0u;
    *flag_dev = 0u;
    io_fence();

    // Host에 REQ(token) 기록
    *req = token;
    io_fence();

    // Host의 ACK(token) 대기
    for (uint32_t spin = 0; spin < spin_limit; ++spin) {
        if (*ack == token) {
            io_fence();
            break;
        }
    }
    if (*ack != token) {
        return false;
    }

    // shared counter 초기화
    *cnt = 0u;
    io_fence();

    // GO(token) 기록
    *go = token;
    io_fence();

    return true;
}

// HPS 측 Peterson software lock acquire: 
// LOCK_DEV와 TURN 값을 갱신한 뒤, Host가 먼저 진입 중이면 대기하여 critical section 진입을 제어
static inline void peterson_lock_device(void)
{
    volatile uint32_t * const flag_self  = (volatile uint32_t *)LOCK_DEV_ADDR;
    volatile uint32_t * const flag_other = (volatile uint32_t *)LOCK_HOST_ADDR;
    volatile uint32_t * const turn       = (volatile uint32_t *)TURN_ADDR;

    // HPS 진입 의사 표시
    *flag_self = 1u;
    io_fence();

    // 동시 진입 시 Host에 우선권 부여
    *turn = TURN_HOST;
    io_fence();

    // Host가 진입 중이고 우선권도 Host에 있으면 대기
    while ((*flag_other != 0u) && (*turn == TURN_HOST)) {
        // spin
    }

    io_fence();
}

// HPS 측 Peterson software lock release: lock flag를 0으로 내려 Host가 접근할 수 있도록 함
static inline void peterson_unlock_device(void)
{
    volatile uint32_t * const flag_self = (volatile uint32_t *)LOCK_DEV_ADDR;

    // HPS 진입 의사 철회
    *flag_self = 0u;
    io_fence();
}

// shared counter를 LIMIT번 증가시키되, 매 증가마다 Peterson lock으로 보호
static uint32_t do_increment_atomic(void)
{
    volatile uint32_t * const p = (volatile uint32_t *)TARGET_ADDR;

    for (uint32_t i = 0; i < LIMIT; ++i) {
        peterson_lock_device();

        // counter read -> increment -> write
        uint32_t v = *p;
        v = v + 1u;
        *p = v;
        io_fence();

        peterson_unlock_device();
    }

    return *p;
}

// Host와 handshake 수행 --> shared counter에 대한 HPS 측 atomic increment 실행 --> DONE(token) 기록 뒤 종료
int main(void)
{
    const uint32_t token = 0xA5A50001u;
    int end = 0;

    // 시작 handshake 수행
    if (!device_handshake_initiate(token, 200000000u)) {
        return -1;
    }

    // HPS 측 atomic increment 수행
    uint32_t result = do_increment_atomic();
    (void)result;

    // DONE(token) 기록
    volatile uint32_t * const done = (volatile uint32_t *)HS_DONE_ADDR;
    io_fence();
    *done = token;
    io_fence();

    end = 1;
    return 0;
}