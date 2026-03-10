/*
 * 이 코드는 공인인증 1번의 CXL.mem 검증을 위해
 * FPGA의 메모리 영역에 직접 read/write하는 과정이다.
 *
 * 동작 방식은 다음과 같다.
 * 1. VFIO를 통해 PCIe 디바이스를 열고 DMA를 위한 Host buffer를 할당한다.
 * 2. 디바이스 메모리의 특정 범위(기본적으로 0x0부터 4바이트 간격으로 15개 위치)의
 *    원래 값을 먼저 읽어 저장한다.
 * 3. 각 주소에 테스트 패턴 값을 써 보고, 다시 읽어서 write/readback 결과가 일치하는지 검사한다.
 * 4. 테스트가 끝나면 처음 읽어 두었던 원래 값을 다시 써서 디바이스 메모리 상태를 복구한다.
 * 5. 마지막에 pass/fail 개수를 요약 출력하고 종료한다.
 *
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <stdatomic.h>

#include "dma.lib.h"

/* 테스트할 주소 개수와 디바이스 메모리 주소 범위를 정의한다. */
#define TEST_COUNT            (15u)
#define DEV_MEM_BASE_ADDR     (0x00000000ull)
#define DEV_MEM_STRIDE_BYTES  (4u)   // 0x0, 0x4, 0x8, ...
#define U32_XFER_BYTES        (4u)

/*
 * Host -> Device(H2D) 방향으로 len 바이트를 디바이스 메모리에 쓰는 공통 helper 함수이다.
 *
 * 동작 흐름:
 * 1. H2D queue를 초기화한다.
 * 2. Host TX buffer에 src 내용을 복사한다.
 * 3. descriptor를 작성해서 "Host TX buffer -> device address" 전송을 준비한다.
 * 4. doorbell을 눌러 DMA를 시작한다.
 * 5. poll_complete()로 descriptor 완료를 기다린다.
 *
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
 * Device -> Host(D2H) 방향으로 len 바이트를 디바이스 메모리에서 읽어 오는 공통 helper 함수이다.
 *
 * 동작 흐름:
 * 1. D2H queue를 초기화한다.
 * 2. Host RX buffer를 0으로 초기화한다.
 * 3. descriptor를 작성해서 "device address -> Host RX buffer" 전송을 준비한다.
 * 4. doorbell을 눌러 DMA를 시작한다.
 * 5. poll_complete()로 descriptor 완료를 기다린다.
 * 6. 완료 후 RX buffer 내용을 dst로 복사한다.
 *
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
 * 디바이스 메모리의 특정 주소에 32-bit 값 하나를 쓰기 위한 간단한 wrapper이다.
 */
static int write_dev_u32(dma_ctx_t *ctx, uint64_t dev_addr, uint32_t value)
{
    return h2d_write_buf(ctx, dev_addr, &value, U32_XFER_BYTES);
}

/*
 * 디바이스 메모리의 특정 주소에서 32-bit 값 하나를 읽기 위한 간단한 wrapper이다.
 */
static int read_dev_u32(dma_ctx_t *ctx, uint64_t dev_addr, uint32_t *value)
{
    return d2h_read_buf(ctx, value, dev_addr, U32_XFER_BYTES);
}

/*
 * 프로그램 전체 실행 흐름:
 *
 * 1. VFIO 초기화
 * 2. DMA buffer 할당
 * 3. 테스트 대상 주소들의 원래 값을 먼저 읽어서 저장
 * 4. 각 주소에 테스트 패턴을 write/readback 하며 일치 여부를 검사
 * 5. 원래 값을 다시 써서 복구
 * 6. 결과 요약 출력
 */
int main(void)
{
    const char *bdf = "0000:41:00.0";

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
     * Descriptor ring, TX buffer, RX buffer를 각각 4KB씩 할당한다.
     * 이 테스트는 매우 작은 데이터(4B)만 다루지만,
     * 공통 DMA helper 구조에 맞춰 충분한 크기의 버퍼를 확보한다.
     */
    st = alloc_dma_buffers(&ctx, 4096, 4096, 4096);
    if (st) {
        printf("alloc_dma_buffers failed: %d\n", st);
        cleanup(&ctx);
        return 2;
    }

    printf("[INFO] using device memory DMA read/write test\n");
    printf("       bdf=%s base=0x%08llx stride=0x%x count=%u\n",
           bdf,
           (unsigned long long)DEV_MEM_BASE_ADDR,
           DEV_MEM_STRIDE_BYTES,
           TEST_COUNT);

    /*
     * 디버깅과 확인을 위해 descriptor/TX/RX 버퍼의 IOVA를 출력한다.
     * DMA descriptor에는 이 IOVA들이 실제 DMA source/destination 주소로 사용된다.
     */
    printf("[INFO] IOVA(desc) = 0x%016" PRIx64 "\n", ctx.desc_iova);
    printf("[INFO] IOVA(tx)   = 0x%016" PRIx64 "\n", ctx.tx_iova);
    printf("[INFO] IOVA(rx)   = 0x%016" PRIx64 "\n", ctx.rx_iova);

    /*
     * orig_vals:
     *   각 테스트 주소의 원래 값을 저장해 두는 배열이다.
     *   테스트 후 복구할 때 사용한다.
     *
     * restored_vals:
     *   복구 후 실제로 다시 읽은 값을 저장하는 배열이다.
     *   원래 값으로 제대로 돌아갔는지 검증할 때 사용한다.
     */
    uint32_t orig_vals[TEST_COUNT] = {0};
    uint32_t restored_vals[TEST_COUNT] = {0};

    /*
     * 테스트 전에 대상 주소 범위의 원래 값을 모두 읽어 저장한다.
     * 주소는 0x0부터 시작해서 4바이트씩 증가하며 총 15개 위치를 검사한다.
     *
     * 예:
     * 0x0, 0x4, 0x8, ..., 0x38
     */
    for (uint32_t i = 0; i < TEST_COUNT; ++i) {
        uint64_t dev_addr = DEV_MEM_BASE_ADDR + ((uint64_t)i * DEV_MEM_STRIDE_BYTES);
        st = read_dev_u32(&ctx, dev_addr, &orig_vals[i]);
        if (st) {
            printf("[FAIL] read original addr 0x%08llx failed: %d\n",
                   (unsigned long long)dev_addr, st);
            cleanup(&ctx);
            return 3;
        }
    }

    printf("[INFO] original values captured for %u locations\n", TEST_COUNT);

    /*
     * pass_cnt:
     *   write 후 readback 값이 정확히 일치한 횟수
     *
     * fail_cnt:
     *   DMA write/read 에러 또는 readback mismatch가 발생한 횟수
     */
    uint32_t pass_cnt = 0u;
    uint32_t fail_cnt = 0u;

    /*
     * 각 주소에 대해 테스트 패턴을 생성해서 쓰고, 다시 읽어서 검증한다.
     *
     * write_val 생성 규칙:
     *   0xA5A50000 | i
     * 즉, 상위 비트는 고정 패턴(A5A5)으로 두고,
     * 하위 일부 비트는 테스트 index를 반영해서 주소마다 다른 값을 쓰도록 한다.
     *
     * 이렇게 하면 각 주소가 구분 가능한 패턴을 가지게 되어,
     * write/readback 결과를 눈으로 확인하기 쉽다.
     */
    for (uint32_t i = 0; i < TEST_COUNT; ++i) {
        uint64_t dev_addr = DEV_MEM_BASE_ADDR + ((uint64_t)i * DEV_MEM_STRIDE_BYTES);
        uint32_t write_val = 0xA5A50000u | i;
        uint32_t rd_back = 0u;

        /* 디바이스 메모리에 테스트 값 write */
        st = write_dev_u32(&ctx, dev_addr, write_val);
        if (st) {
            printf("[FAIL] addr 0x%08llx write 0x%08x failed: %d\n",
                   (unsigned long long)dev_addr, write_val, st);
            fail_cnt++;
            continue;
        }

        /* 같은 주소를 다시 읽어서 readback 값 확인 */
        st = read_dev_u32(&ctx, dev_addr, &rd_back);
        if (st) {
            printf("[FAIL] addr 0x%08llx readback failed after write 0x%08x: %d\n",
                   (unsigned long long)dev_addr, write_val, st);
            fail_cnt++;
            continue;
        }

        /*
         * write 값과 readback 값이 정확히 같으면 PASS로 집계한다.
         * 값이 다르면 MMIO가 아니라 DMA data path 관점에서 mismatch가 발생한 것으로 보고 WARN/FAIL 처리한다.
         */
        if (rd_back == write_val) {
            printf("[PASS] addr 0x%08llx write 0x%08x -> read 0x%08x\n",
                   (unsigned long long)dev_addr, write_val, rd_back);
            pass_cnt++;
        } else {
            printf("[WARN] addr 0x%08llx write 0x%08x -> read 0x%08x\n",
                   (unsigned long long)dev_addr, write_val, rd_back);
            fail_cnt++;
        }
    }

    /*
     * 테스트가 끝나면 처음 저장해 두었던 원래 값을 다시 써서
     * 디바이스 메모리 상태를 복구한다.
     *
     * 이후 한 번 더 읽어서 restored_vals에 저장하고,
     * orig_vals와 비교하여 복구가 정확히 되었는지 확인한다.
     */
    for (uint32_t i = 0; i < TEST_COUNT; ++i) {
        uint64_t dev_addr = DEV_MEM_BASE_ADDR + ((uint64_t)i * DEV_MEM_STRIDE_BYTES);

        st = write_dev_u32(&ctx, dev_addr, orig_vals[i]);
        if (st) {
            printf("[FAIL] restore addr 0x%08llx to 0x%08x failed: %d\n",
                   (unsigned long long)dev_addr, orig_vals[i], st);
            cleanup(&ctx);
            return 4;
        }

        st = read_dev_u32(&ctx, dev_addr, &restored_vals[i]);
        if (st) {
            printf("[FAIL] read restored addr 0x%08llx failed: %d\n",
                   (unsigned long long)dev_addr, st);
            cleanup(&ctx);
            return 5;
        }

        if (restored_vals[i] == orig_vals[i]) {
            printf("[PASS] restore addr 0x%08llx -> 0x%08x\n",
                   (unsigned long long)dev_addr, restored_vals[i]);
        } else {
            printf("[WARN] restore addr 0x%08llx expected 0x%08x got 0x%08x\n",
                   (unsigned long long)dev_addr, orig_vals[i], restored_vals[i]);
        }
    }

    /* 전체 테스트 결과 요약 출력 */
    printf("[SUMMARY] pass=%u fail=%u\n", pass_cnt, fail_cnt);

    /* DMA buffer 및 VFIO 디바이스 핸들 정리 */
    cleanup(&ctx);

    /*
     * fail이 하나도 없으면 성공 종료(0),
     * 하나라도 있으면 비정상 종료 코드(6)를 반환한다.
     */
    if (fail_cnt == 0u) {
        return 0;
    }
    return 6;
}