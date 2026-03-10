#include <stdint.h>
#include <stdbool.h>

// HPS에서 보는 shared memory 주소
//  - counter: 0x8100_0000
//  - handshake base: 0x8110_0000
#define TARGET_ADDR  ((uintptr_t)0x81000000u)
#define HS_BASE      ((uintptr_t)0x81100000u)

#define HS_REQ_ADDR  (HS_BASE + 0x0u)
#define HS_ACK_ADDR  (HS_BASE + 0x4u)
#define HS_GO_ADDR   (HS_BASE + 0x8u)
#define HS_DONE_ADDR (HS_BASE + 0xCu)

#define LIMIT        (500u)

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

// ------------------------------------------------------------
// Device(initiator) handshake
//   Host는 아래 동작을 해야 함(나중에 Host 코드에서 구현):
//    - REQ==token 대기
//    - ACK=token 기록
//    - GO==token 대기
// ------------------------------------------------------------
static bool device_handshake_initiate(uint32_t token, uint32_t spin_limit)
{
    volatile uint32_t * const req  = (volatile uint32_t *)HS_REQ_ADDR;
    volatile uint32_t * const ack  = (volatile uint32_t *)HS_ACK_ADDR;
    volatile uint32_t * const go   = (volatile uint32_t *)HS_GO_ADDR;
    volatile uint32_t * const done = (volatile uint32_t *)HS_DONE_ADDR;
    volatile uint32_t * const cnt  = (volatile uint32_t *)TARGET_ADDR;

    // (선택) 이전 실행 값/잔존값 방지
    // Host가 먼저 init한다고 해도, Device쪽에서 한번 더 정리하면 안전해짐.
    *done = 0u;
    *go   = 0u;
    *ack  = 0u;
    io_fence();

    // 1) Device가 REQ를 던짐
    *req = token;
    io_fence();

    // 2) Host가 ACK=token 써줄 때까지 대기
    for (uint32_t spin = 0; spin < spin_limit; ++spin) {
        if (*ack == token) {
            io_fence();
            break;
        }
    }
    if (*ack != token) {
        return false; // ACK timeout
    }

    // 3) GO 전에 counter를 0으로 맞춰서, Host/Device가 같이 0부터 시작하도록 함
    *cnt = 0u;
    io_fence();

    // 4) GO=token -> Host는 GO를 보고 시작
    *go = token;
    io_fence();

    return true;
}

static uint32_t do_increment(void)
{
    volatile uint32_t * const p = (volatile uint32_t *)TARGET_ADDR;

    for (uint32_t i = 0; i < LIMIT; ++i) {
        (*p)++;
    }
    return *p;
}

int main(void)
{
    const uint32_t token = 0xA5A50001u;
    int end = 0;

    // Host가 먼저 init 후 REQ를 기다리는 상태여야 함
    if (!device_handshake_initiate(token, 200000000u)) {
        return -1;
    }

    uint32_t result = do_increment();
    (void)result;

    // 완료 신호
    volatile uint32_t * const done = (volatile uint32_t *)HS_DONE_ADDR;
    io_fence();
    *done = token;
    io_fence();

    // breakpoint용
    end = 1;
    return 0;
}
