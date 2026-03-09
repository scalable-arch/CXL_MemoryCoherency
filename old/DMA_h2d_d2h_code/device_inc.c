#include <stdint.h>
#include <stdatomic.h>

// device DDR base (host의 DEV_ADDR_TMP와 동일해야 함)
#define DEVSHM_BASE         (0xDEAD0000ull + 0x1000ull)

#define OFF_WANT_HOST       0u
#define OFF_WANT_DEV        4u
#define OFF_TURN            8u
#define OFF_COUNTER_DEV     12u
#define OFF_START_A         16u
#define OFF_DONE_HOST_A     20u
#define OFF_DONE_DEV_A      24u

#define TURN_HOST           1u
#define TURN_DEV            2u

#define OFF_CMD_B           64u
#define OFF_ACK_B           68u
#define OFF_STAGE_B         72u

static inline volatile uint32_t* dev_u32(uint32_t off)
{
    return (volatile uint32_t *)((uintptr_t)(DEVSHM_BASE + (uint64_t)off));
}

// 시나리오 A (Host의 시나리오 A에서' 값을 올리고 start를 올린 다음에 동작)
// 1) start_a==1이 될 때까지 대기 (Host가 공유 변수 초기화 완료 + 시작 트리거)
// 2) Device 공유 변수에 직접 접근(load/store)하며 Dekker(q) 수행 + counter +1
// 3) done_dev_a=1로 완료 알림

// 시나리오 B
// 1) cmd_b==1이 될 때까지 대기 (Host가 stage를 써주고 요청을 올림)
// 2) stage_b를 +1하고 ack_b=1로 완료 알림 (필요하면 cmd_b=0으로 클리어)
// 3) 종료

int main(void)
{
    volatile uint32_t *want_host   = dev_u32(OFF_WANT_HOST);
    volatile uint32_t *want_dev    = dev_u32(OFF_WANT_DEV);
    volatile uint32_t *turn        = dev_u32(OFF_TURN);
    volatile uint32_t *counter_dev = dev_u32(OFF_COUNTER_DEV);
    volatile uint32_t *start_a     = dev_u32(OFF_START_A);
    volatile uint32_t *done_dev_a  = dev_u32(OFF_DONE_DEV_A);

    volatile uint32_t *cmd_b       = dev_u32(OFF_CMD_B);
    volatile uint32_t *ack_b       = dev_u32(OFF_ACK_B);
    volatile uint32_t *stage_b     = dev_u32(OFF_STAGE_B);

    // =========================
    // 시나리오 A: Device 공유 변수 접근 (Dekker 기반, 1회)
    // =========================
    while (*start_a == 0) {
        // host가 초기화하고 start=1로 세팅할 때까지 대기
    }

    // ---- Device Dekker(q) 1회 ----
    *want_dev = 1;
    atomic_thread_fence(memory_order_seq_cst);

    while (*want_host) {
        if (*turn == TURN_HOST) {
            *want_dev = 0;
            while (*turn != TURN_DEV) {
                // spin
            }
            *want_dev = 1;
            atomic_thread_fence(memory_order_seq_cst);
        }
    }

    *counter_dev = *counter_dev + 1;

    *turn = TURN_HOST;
    *want_dev = 0;
    atomic_thread_fence(memory_order_seq_cst);

    *done_dev_a = 1;

    // =========================
    // 시나리오 B: Host 공유 변수 접근 (1회)
    // - host가 stage 값을 써주고 cmd=1을 올리면
    // - device가 stage++ 하고 ack=1 세팅
    // =========================
    while (*cmd_b == 0) {
        // host 요청 대기
    }

    *stage_b = *stage_b + 1;
    atomic_thread_fence(memory_order_seq_cst);

    *ack_b = 1;
    *cmd_b = 0; // 재요청 대비(선택)
    atomic_thread_fence(memory_order_seq_cst);

    return 0;
}
