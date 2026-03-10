#include <stdint.h>
#include <stdbool.h>

// HPS에서 보는 shared memory 주소
#define TARGET_ADDR      ((uintptr_t)0x81000000u)
#define HS_BASE          ((uintptr_t)0x81100000u)

#define HS_REQ_ADDR      (HS_BASE + 0x00u)
#define HS_ACK_ADDR      (HS_BASE + 0x04u)
#define HS_GO_ADDR       (HS_BASE + 0x08u)
#define HS_DONE_ADDR     (HS_BASE + 0x0Cu)

// Peterson lock vars
#define LOCK_HOST_ADDR   (HS_BASE + 0x20u)
#define LOCK_DEV_ADDR    (HS_BASE + 0x40u)
#define TURN_ADDR        (HS_BASE + 0x60u)

#define TURN_HOST        (0u)
#define TURN_DEV         (1u)

#define LIMIT            (50000u)

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

// Device initiates: REQ -> wait ACK -> reset counter -> GO
static bool device_handshake_initiate(uint32_t token, uint32_t spin_limit)
{
    volatile uint32_t * const req      = (volatile uint32_t *)HS_REQ_ADDR;
    volatile uint32_t * const ack      = (volatile uint32_t *)HS_ACK_ADDR;
    volatile uint32_t * const go       = (volatile uint32_t *)HS_GO_ADDR;
    volatile uint32_t * const done     = (volatile uint32_t *)HS_DONE_ADDR;
    volatile uint32_t * const cnt      = (volatile uint32_t *)TARGET_ADDR;
    volatile uint32_t * const flag_dev = (volatile uint32_t *)LOCK_DEV_ADDR;

    // 최소 초기화
    *done     = 0u;
    *go       = 0u;
    *ack      = 0u;
    *flag_dev = 0u;
    io_fence();

    // REQ 보내기
    *req = token;
    io_fence();

    // ACK 대기
    for (uint32_t spin = 0; spin < spin_limit; ++spin) {
        if (*ack == token) {
            io_fence();
            break;
        }
    }
    if (*ack != token) {
        return false;
    }

    // 시작 직전 counter를 0으로 맞춤
    *cnt = 0u;
    io_fence();

    // GO 보내기
    *go = token;
    io_fence();

    return true;
}

// Peterson mutex: device side
static inline void peterson_lock_device(void)
{
    volatile uint32_t * const flag_self  = (volatile uint32_t *)LOCK_DEV_ADDR;
    volatile uint32_t * const flag_other = (volatile uint32_t *)LOCK_HOST_ADDR;
    volatile uint32_t * const turn       = (volatile uint32_t *)TURN_ADDR;

    *flag_self = 1u;
    io_fence();

    *turn = TURN_HOST;
    io_fence();

    while ((*flag_other != 0u) && (*turn == TURN_HOST)) {
        // spin
    }

    io_fence();
}

static inline void peterson_unlock_device(void)
{
    volatile uint32_t * const flag_self = (volatile uint32_t *)LOCK_DEV_ADDR;

    *flag_self = 0u;
    io_fence();
}

static uint32_t do_increment_atomic(void)
{
    volatile uint32_t * const p = (volatile uint32_t *)TARGET_ADDR;

    for (uint32_t i = 0; i < LIMIT; ++i) {
        peterson_lock_device();

        uint32_t v = *p;
        v = v + 1u;
        *p = v;
        io_fence();

        peterson_unlock_device();
    }

    return *p;
}

int main(void)
{
    const uint32_t token = 0xA5A50001u;
    int end = 0;

    if (!device_handshake_initiate(token, 200000000u)) {
        return -1;
    }

    uint32_t result = do_increment_atomic();
    (void)result;

    volatile uint32_t * const done = (volatile uint32_t *)HS_DONE_ADDR;
    io_fence();
    *done = token;
    io_fence();

    end = 1;
    return 0;
}