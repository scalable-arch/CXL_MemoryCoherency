#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <sched.h>
#include <stdlib.h>
#include <stdatomic.h>

#include "dma.lib.h"   // DMA 라이브러리

// 시나리오 A: Device 공유 변수 접근 (Dekker 기반, 각 1회)
// 시나리오 B: Host 공유 변수 접근 (각 1회)


// ----------------------
// Device 공유 변수(시나리오 A)
#define DEVSHM_BASE         (DEV_ADDR_TMP) // 이걸 기준으로 device DDR에 위치한 공유 변수 offset 정의

#define OFF_WANT_HOST       0u
#define OFF_WANT_DEV        4u
#define OFF_TURN            8u
#define OFF_COUNTER_DEV     12u
#define OFF_START_A         16u
#define OFF_DONE_HOST_A     20u
#define OFF_DONE_DEV_A      24u

#define TURN_HOST           1u
#define TURN_DEV            2u

// ----------------------
// Host 공유 변수(시나리오 B)
// - host counter는 "rx buffer"의 offset0에 둠 (Host CPU가 직접 접근 가능)
// - device stage/command/ack는 device DDR에 둠
// - ack는 D2H로 rx buffer offset4에 받아서 counter(offset0) 덮어쓰기 방지
// ----------------------
#define RX_OFF_HOST_COUNTER 0u
#define RX_OFF_HOST_ACKBUF  4u

#define OFF_CMD_B           64u
#define OFF_ACK_B           68u
#define OFF_STAGE_B         72u

static inline uint64_t dev_addr(uint32_t off) {
    return (uint64_t)DEVSHM_BASE + (uint64_t)off;
}

// Host가 DMA(H2D 방향)로 디바이스 메모리(예: device DDR의 특정 주소)에 32-bit 값을 써 넣는 함수
// Host tx buffer(tx_va)에 value write -> H2D descriptor 작성 -> doorbell -> poll_complete 동작
static int h2d_write_u32(dma_ctx_t *ctx, uint64_t dst_dev_addr, uint32_t v)
{
    int st = 0;
    uint32_t desc_idx = 1;

    // 큐 reset+enable (desc_idx=1 재사용 안전화)
    st = qcsr_init_queue(ctx, QCSR_DIR_H2D, QUEUE_ID, ctx->desc_iova, RING_ORDER_LOG2);
    if (st) return st;

    memcpy(ctx->tx_va, &v, sizeof(v));
    atomic_thread_fence(memory_order_release);

    st = write_desc_h2d(ctx, desc_idx, dst_dev_addr, (uint32_t)sizeof(uint32_t));
    if (st) return st;

    st = doorbell(ctx, QCSR_DIR_H2D, QUEUE_ID, desc_idx);
    if (st) return st;

    st = poll_complete(ctx, QCSR_DIR_H2D, QUEUE_ID, desc_idx, NULL);
    if (st) return st;

    return 0;
}

// host가 DMA(D2H 방향)로 device 주소에서 32-bit 값을 “읽어서” host rx buffer에 받아오는 함수
// D2H descriptor 작성 -> doorbell -> poll_complete -> Host rx buffer(rx_va+rx_off)에서 value read
static int d2h_read_u32_to_rx(dma_ctx_t *ctx, uint64_t src_dev_addr, uint32_t rx_off, uint32_t *out)
{
    int st = 0;
    uint32_t desc_idx = 1;

    // rx_off로 쓰기 위해 destination IOVA를 임시로 이동
    uint64_t saved_rx_iova = ctx->rx_iova;
    ctx->rx_iova = saved_rx_iova + (uint64_t)rx_off;

    // 큐 reset+enable (desc_idx=1 재사용 안전화)
    st = qcsr_init_queue(ctx, QCSR_DIR_D2H, QUEUE_ID, ctx->desc_iova, RING_ORDER_LOG2);
    if (st) { ctx->rx_iova = saved_rx_iova; return st; }

    st = write_desc_d2h(ctx, desc_idx, src_dev_addr, (uint32_t)sizeof(uint32_t));
    if (st) { ctx->rx_iova = saved_rx_iova; return st; }

    st = doorbell(ctx, QCSR_DIR_D2H, QUEUE_ID, desc_idx);
    if (st) { ctx->rx_iova = saved_rx_iova; return st; }

    st = poll_complete(ctx, QCSR_DIR_D2H, QUEUE_ID, desc_idx, NULL);
    if (st) { ctx->rx_iova = saved_rx_iova; return st; }

    atomic_thread_fence(memory_order_acquire);

    // rx_va는 base 그대로이므로, rx_off에서 읽기
    memcpy(out, ((uint8_t*)ctx->rx_va + rx_off), sizeof(uint32_t));

    // 원복
    ctx->rx_iova = saved_rx_iova;
    return 0;
}

// 시나리오 A
// 1) VFIO open + 버퍼(desc/tx/rx) 할당 + (H2D/D2H) DMA 큐 초기화
// 2) (Host가 먼저) Device 공유 변수(want/turn/counter/done/start)를 초기화하고 start=1로 device 실행 트리거
// 3) Host가 Device 공유 변수에 DMA로 접근하며 Dekker(p) 수행 + counter +1
// 4) done_host=1 세팅 후 done_dev를 폴링해서 결과(counter) 체크

// 시나리오 B (device_inc.c가 값을 올리고 done.ack를 준 다음에)
// 1) Host 메모리의 counter를 Host CPU가 직접 +1
// 2) 그 값을 device DDR의 stage로 DMA(H2D)로 보내고, cmd=1로 device에 stage++ 요청
// 3) ack를 DMA(D2H)로 폴링하고 stage를 다시 DMA(D2H)로 회수해서 host counter가 최종 2가 되게 함
int main(int argc, char **argv)
{
    const char *bdf = "0000:41:00.0";

    dma_ctx_t ctx = (dma_ctx_t){0};
    ctx.desc_memid = ctx.tx_memid = ctx.rx_memid = -1;

    int host_inc_status = init_vfio(&ctx, bdf);
    if (host_inc_status) {
        printf("init_vfio failed: %d\n", host_inc_status);
        return 1;
    }

    // D2H까지 쓰므로 rx_bytes도 반드시 필요
    host_inc_status = alloc_dma_buffers(&ctx, 4096, 64, 64);
    if (host_inc_status) {
        printf("alloc_dma_buffers failed: %d\n", host_inc_status);
        cleanup(&ctx);
        return 1;
    }

    // =========================
    // 시나리오 A: Device 공유 변수 접근 (Dekker 기반, 각 1회)
    // =========================
    // Host가 device DDR의 공유 변수 초기화 + start flag 세팅
    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_WANT_HOST), 0);
    if (host_inc_status) goto out;
    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_WANT_DEV), 0);
    if (host_inc_status) goto out;
    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_TURN), TURN_HOST);
    if (host_inc_status) goto out;
    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_COUNTER_DEV), 0);
    if (host_inc_status) goto out;
    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_DONE_HOST_A), 0);
    if (host_inc_status) goto out;
    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_DONE_DEV_A), 0);
    if (host_inc_status) goto out;
    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_START_A), 1);
    if (host_inc_status) goto out;

    // ---- Host Dekker(p) 1회 ----
    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_WANT_HOST), 1);
    if (host_inc_status) goto out;

    while (1) {
        uint32_t want_dev = 0;
        host_inc_status = d2h_read_u32_to_rx(&ctx, dev_addr(OFF_WANT_DEV), 0, &want_dev);
        if (host_inc_status) goto out;
        if (want_dev == 0) break;

        uint32_t turn = 0;
        host_inc_status = d2h_read_u32_to_rx(&ctx, dev_addr(OFF_TURN), 0, &turn);
        if (host_inc_status) goto out;

        if (turn == TURN_DEV) {
            host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_WANT_HOST), 0);
            if (host_inc_status) goto out;

            do {
                sched_yield();
                host_inc_status = d2h_read_u32_to_rx(&ctx, dev_addr(OFF_TURN), 0, &turn);
                if (host_inc_status) goto out;
            } while (turn != TURN_HOST);

            host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_WANT_HOST), 1);
            if (host_inc_status) goto out;
        }
    }

    // critical section: counter_dev++
    {
        uint32_t c = 0;
        host_inc_status = d2h_read_u32_to_rx(&ctx, dev_addr(OFF_COUNTER_DEV), 0, &c);
        if (host_inc_status) goto out;
        c = c + 1;
        host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_COUNTER_DEV), c);
        if (host_inc_status) goto out;
    }

    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_TURN), TURN_DEV);
    if (host_inc_status) goto out;
    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_WANT_HOST), 0);
    if (host_inc_status) goto out;
    host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_DONE_HOST_A), 1);
    if (host_inc_status) goto out;

    // Device done 대기
    while (1) {
        uint32_t done_dev = 0;
        host_inc_status = d2h_read_u32_to_rx(&ctx, dev_addr(OFF_DONE_DEV_A), 0, &done_dev);
        if (host_inc_status) goto out;
        if (done_dev) break;
        sched_yield();
    }

    // 결과 확인
    {
        uint32_t final_dev = 0;
        host_inc_status = d2h_read_u32_to_rx(&ctx, dev_addr(OFF_COUNTER_DEV), 0, &final_dev);
        if (host_inc_status) goto out;
        printf("[Scenario A] device counter final = %u (expect 2)\n", final_dev);
    }

    // =========================
    // 시나리오 B: Host 공유 변수 접근 (각 1회)
    // =========================
    // host counter는 rx buffer offset0
    {
        uint32_t *host_counter_ptr = (uint32_t *)((uint8_t*)ctx.rx_va + RX_OFF_HOST_COUNTER);
        *host_counter_ptr = 0;
        atomic_thread_fence(memory_order_seq_cst);

        // Host가 host memory에서 직접 +1
        *host_counter_ptr = *host_counter_ptr + 1;
        atomic_thread_fence(memory_order_seq_cst);

        // device-side cmd/ack 초기화
        host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_ACK_B), 0);
        if (host_inc_status) goto out;
        host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_CMD_B), 0);
        if (host_inc_status) goto out;

        // (1) host counter 값을 device stage로 전달 (H2D)
        memcpy(ctx.tx_va, host_counter_ptr, sizeof(uint32_t));
        host_inc_status = qcsr_init_queue(&ctx, QCSR_DIR_H2D, QUEUE_ID, ctx.desc_iova, RING_ORDER_LOG2);
        if (host_inc_status) goto out;
        host_inc_status = write_desc_h2d(&ctx, 1, dev_addr(OFF_STAGE_B), 4);
        if (host_inc_status) goto out;
        host_inc_status = doorbell(&ctx, QCSR_DIR_H2D, QUEUE_ID, 1);
        if (host_inc_status) goto out;
        host_inc_status = poll_complete(&ctx, QCSR_DIR_H2D, QUEUE_ID, 1, NULL);
        if (host_inc_status) goto out;

        // (2) cmd=1 (device에게 stage++ 요청)
        host_inc_status = h2d_write_u32(&ctx, dev_addr(OFF_CMD_B), 1);
        if (host_inc_status) goto out;

        // (3) ack polling (D2H로 device ack 읽기 -> rx offset4)
        while (1) {
            uint32_t ack = 0;
            host_inc_status = d2h_read_u32_to_rx(&ctx, dev_addr(OFF_ACK_B), RX_OFF_HOST_ACKBUF, &ack);
            if (host_inc_status) goto out;
            if (ack) break;
            sched_yield();
        }

        // (4) stage 값을 host counter로 회수 (D2H -> rx offset0)
        {
            int st = 0;
            // dest = rx base (offset0)
            uint64_t saved_rx_iova = ctx.rx_iova;

            st = qcsr_init_queue(&ctx, QCSR_DIR_D2H, QUEUE_ID, ctx.desc_iova, RING_ORDER_LOG2);
            if (st) { host_inc_status = st; goto out; }

            st = write_desc_d2h(&ctx, 1, dev_addr(OFF_STAGE_B), 4);
            if (st) { host_inc_status = st; goto out; }

            st = doorbell(&ctx, QCSR_DIR_D2H, QUEUE_ID, 1);
            if (st) { host_inc_status = st; goto out; }

            st = poll_complete(&ctx, QCSR_DIR_D2H, QUEUE_ID, 1, NULL);
            if (st) { host_inc_status = st; goto out; }

            atomic_thread_fence(memory_order_acquire);
            ctx.rx_iova = saved_rx_iova;
        }

        printf("[Scenario B] host counter final = %u (expect 2)\n", *host_counter_ptr);
    }

out:
    if (host_inc_status) printf("HOST error: %d\n", host_inc_status);
    cleanup(&ctx);
    return (host_inc_status ? 1 : 0);
}
