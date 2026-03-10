/*
 * 이 코드는 공인인증 1번의 CXL.io 검증을 위해
 * FPGA의 io영역 (BAR 영역) 중 일부인 QCSR 레지스터에 값을 쓰고 읽는 테스트이다.
 *
 * 동작 개요는 다음과 같다.
 * 1. VFIO를 통해 PCIe 디바이스(BDF = 0000:41:00.0)를 연다.
 * 2. BAR0에 매핑된 QCSR 영역에서 D2H queue 0을 reset한다.
 * 3. QCSR의 Q_SIZE 레지스터를 테스트 대상으로 선택한다.
 * 4. 원래 Q_SIZE 값을 먼저 읽어 저장한다.
 * 5. Q_SIZE 레지스터에 1부터 0xE까지 순서대로 값을 써 보고,
 *    각 값이 그대로 readback 되는지 확인한다.
 * 6. 테스트가 끝나면 처음 읽어 두었던 원래 값을 다시 써서 레지스터 상태를 복구한다.
 * 7. 마지막에 pass/fail 개수를 출력하고 종료한다.
 *
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>

#include "dma.lib.h"

/*
 * QCSR의 Q_RESET 레지스터를 통해 reset하는 함수
 *
 * 동작 방식:
 * - QCSR_ADDR(dir, q, Q_RESET_OFF)로 해당 큐의 reset register offset을 계산한다.
 * - 그 register에 1을 써서 reset을 요청한다.
 * - 이후 같은 register를 계속 읽으면서 값이 0으로 돌아올 때까지 polling한다.
 */
static int qcsr_reset_queue_mmio(dma_ctx_t *ctx, uint32_t dir, uint32_t q)
{
    int st = 0;
    uint32_t reset_val = 0;
    uint32_t reset_off = QCSR_ADDR(dir, q, Q_RESET_OFF);

    st = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, reset_off, 1u);
    if (st) return st;

    do {
        st = bwvfio_ms_read32(&ctx->dev, QCSR_REGION, reset_off, &reset_val);
        if (st) return st;
    } while (reset_val != 0u);

    return 0;
}

/*
 * BAR0 MMIO register만 직접 접근하는 함수
 */
static void close_only(dma_ctx_t *ctx)
{
    if (!ctx) return;
    bwvfio_close_dev(&ctx->dev);
}

/*
 * main() 실행 흐름:
 *
 * 1. PCIe 디바이스를 VFIO로 open
 * 2. D2H queue 0 reset
 * 3. Q_SIZE register offset 계산
 * 4. 원래 값 read
 * 5. 1~0xE까지 write/readback test 수행
 * 6. 원래 값 restore
 * 7. 최종 pass/fail summary 출력
 *
 */
int main(void)
{
    const char *bdf = "0000:41:00.0";
    const uint32_t dir = QCSR_DIR_D2H;
    const uint32_t qid = 0u;

    /*
     * dma_ctx_t 컨텍스트를 0으로 초기화한 뒤,
     * memid 계열은 "미할당 상태"를 명확히 표현하기 위해 -1로 세팅
     */
    dma_ctx_t ctx = (dma_ctx_t){0};
    ctx.desc_memid   = -1;
    ctx.tx_memid     = -1;
    ctx.rx_memid     = -1;
    ctx.shared_memid = -1;

    /* VFIO 디바이스 open 및 bus master enable 수행 */
    int st = init_vfio(&ctx, bdf);
    if (st) {
        printf("init_vfio failed: %d\n", st);
        return 1;
    }

    /*
     * 테스트 전에 대상 queue를 reset
    */
    st = qcsr_reset_queue_mmio(&ctx, dir, qid);
    if (st) {
        printf("queue reset failed: %d\n", st);
        close_only(&ctx);
        return 2;
    }

    /*
     * QCSR의 Q_SIZE register를 대상으로 사용한다. 이 위치를 찾기 위해
     * QCSR_ADDR()로 dir/qid에 대응되는 BAR 내부 offset을 계산한다.
     */
    const uint32_t test_off = QCSR_ADDR(dir, qid, Q_SIZE_OFF);

    printf("[INFO] using QCSR Q_SIZE register\n");
    printf("       bdf=%s dir=d2h qid=%u off=0x%08x\n", bdf, qid, test_off);

    /*
     * 레지스터를 덮어쓰기 전에 원래 값을 먼저 읽어 둔다.
     * 테스트 종료 후 이 값을 다시 써서 register 상태를 복구한다.
     */
    uint32_t orig_val = 0u;
    st = bwvfio_ms_read32(&ctx.dev, QCSR_REGION, test_off, &orig_val);
    if (st) {
        printf("read original failed: %d\n", st);
        close_only(&ctx);
        return 3;
    }

    printf("[INFO] original val = 0x%08x\n", orig_val);

    /*
     * 각 테스트 케이스의 성공/실패 개수를 누적하기 위한 카운터
     */
    uint32_t pass_cnt = 0u;
    uint32_t fail_cnt = 0u;

    /*
     * Q_SIZE register에 1부터 0xE까지 순서대로 값을 써 보고,
     * 매번 바로 readback 해서 동일한 값이 읽히는지 검사한다.
     */
    for (uint32_t write_val = 1u; write_val <= 0xEu; ++write_val) {
        uint32_t rd_back = 0u;

        /* 테스트 값 write */
        st = bwvfio_ms_write32(&ctx.dev, QCSR_REGION, test_off, write_val);
        if (st) {
            printf("[FAIL] write 0x%08x failed: %d\n", write_val, st);
            fail_cnt++;
            continue;
        }

        /* 같은 register를 즉시 다시 읽어서 readback 값 확인 */
        st = bwvfio_ms_read32(&ctx.dev, QCSR_REGION, test_off, &rd_back);
        if (st) {
            printf("[FAIL] readback after write 0x%08x failed: %d\n", write_val, st);
            fail_cnt++;
            continue;
        }

        /*
         * write 값과 readback 값이 정확히 같으면 PASS로 처리
         */
        if (rd_back == write_val) {
            printf("[PASS] write 0x%08x -> read 0x%08x\n", write_val, rd_back);
            pass_cnt++;
        } else {
            printf("[WARN] write 0x%08x -> read 0x%08x\n", write_val, rd_back);
            fail_cnt++;
        }
    }

    /*
     * 테스트가 끝난 뒤 원래 Q_SIZE 값을 다시 써서 레지스터를 복구
     */
    st = bwvfio_ms_write32(&ctx.dev, QCSR_REGION, test_off, orig_val);
    if (st) {
        printf("restore original failed: %d\n", st);
        close_only(&ctx);
        return 4;
    }

    /*
     * 복구가 실제로 반영되었는지 다시 읽어서 확인한다.
     * orig_val과 restored가 같아야 정상 복구로 판단한다.
     */
    uint32_t restored = 0u;
    st = bwvfio_ms_read32(&ctx.dev, QCSR_REGION, test_off, &restored);
    if (st) {
        printf("read restored value failed: %d\n", st);
        close_only(&ctx);
        return 5;
    }

    printf("[INFO] restored val = 0x%08x\n", restored);

    if (restored == orig_val) {
        printf("[PASS] original value restored.\n");
    } else {
        printf("[WARN] restore mismatched. expected=0x%08x got=0x%08x\n",
               orig_val, restored);
    }

    printf("[SUMMARY] pass=%u fail=%u\n", pass_cnt, fail_cnt);

    close_only(&ctx);

    if (fail_cnt == 0u) {
        return 0;
    }
    return 6;
}