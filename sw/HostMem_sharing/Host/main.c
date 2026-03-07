#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <inttypes.h>
#include <stdatomic.h>
#include <unistd.h>   // usleep
#include <errno.h>    // ETIMEDOUT

#include "dma.lib.h"

// ============================================================
// Host <-> HPS Shared-Memory test
//
// 목표:
//  - Host에서 IOVA 0x0100_0000에 공유 메모리를 할당 (VFIO/IOMMU map)
//  - HPS에서는 h2f bridge base=0x8000_0000 이므로,
//      HPS addr 0x8100_0000 == Host IOVA 0x0100_0000
//  - 공유 메모리 안에서:
//      counter @ +0x0000_0000 (word0)
//      handshake base @ +0x0010_0000 (REQ/ACK/GO/DONE)
//  - 동작 흐름:
//      1) REQ=token
//      2) ACK==token 대기
//      3) GO=token
//      4) Host increment N회
//      5) DONE==token(HPS 완료) 대기
//      6) DONE=0으로 클리어, 최종 counter 출력
//
// 주의:
//  - 원자성(atomicity)은 현재 단계에서 무시(요청사항)
// ============================================================

// ---- 공유 메모리 IOVA/크기 ----
#define SHARED_IOVA_BASE   (0x01000000ull)                 // 요구사항: IOVA=0x1000000
#define SHARED_BYTES       (2ull * 1024ull * 1024ull)      // 2MB (HS_BASE=+1MB 포함)

// ---- HPS 쪽에서 보는 주소 계산용(디버그 출력) ----
#define HPS_H2F_BASE       (0x80000000ull)

// ---- 공유 메모리 내부 오프셋(Host VA 기준) ----
#define COUNTER_OFF        (0x00000000u)
#define HS_BASE_OFF        (0x00100000u)

#define HS_REQ_OFF         (HS_BASE_OFF + 0x0u)
#define HS_ACK_OFF         (HS_BASE_OFF + 0x4u)
#define HS_GO_OFF          (HS_BASE_OFF + 0x8u)
#define HS_DONE_OFF        (HS_BASE_OFF + 0xCu)

// ---- 동작 파라미터 ----
#define HOST_INC_COUNT     (500u)   // HPS LIMIT=500과 맞추면 기대값은 1000(atomic이면)

static inline void host_fence(void)
{
    // CPU reordering 방지(compiler + CPU)
    atomic_thread_fence(memory_order_seq_cst);
}

static inline volatile uint32_t *shm_u32_ptr(uint8_t *base, uint32_t off)
{
    return (volatile uint32_t *)(void *)(base + off);
}

// --------------------
// Shared memory 기반 핸드셰이크
// --------------------
static int host_barrier_handshake_shared(uint8_t *shared_va,
                                         uint32_t token,
                                         uint32_t poll_limit,
                                         uint32_t poll_sleep_us)
{
    volatile uint32_t * const req  = shm_u32_ptr(shared_va, HS_REQ_OFF);
    volatile uint32_t * const ack  = shm_u32_ptr(shared_va, HS_ACK_OFF);
    volatile uint32_t * const go   = shm_u32_ptr(shared_va, HS_GO_OFF);
    volatile uint32_t * const done = shm_u32_ptr(shared_va, HS_DONE_OFF);

    // (1) REQ=token, ACK/GO/DONE=0
    *done = 0u;
    *ack  = 0u;
    *go   = 0u;
    host_fence();

    *req = token;
    host_fence();

    // (2) ACK==token 폴링
    for (uint32_t i = 0; i < poll_limit; ++i) {
        if (*ack == token) {
            host_fence();
            break;
        }
        if (poll_sleep_us) usleep(poll_sleep_us);
    }
    if (*ack != token) return -ETIMEDOUT;

    // (3) GO=token
    *go = token;
    host_fence();

    return 0;
}

// --------------------
// Shared memory 기반 Host increment
// --------------------
static int host_increment_n_times_shared(uint8_t *shared_va, uint32_t n)
{
    volatile uint32_t * const counter = shm_u32_ptr(shared_va, COUNTER_OFF);

    for (uint32_t i = 0; i < n; ++i) {
        // 원자성은 현재 단계에서 무시
        (*counter)++;
    }
    host_fence();
    return 0;
}

// --------------------
// HPS 완료(DONE) 대기 + clear
// --------------------
static int host_wait_done_and_clear(uint8_t *shared_va,
                                    uint32_t token,
                                    uint32_t poll_limit,
                                    uint32_t poll_sleep_us)
{
    volatile uint32_t * const done = shm_u32_ptr(shared_va, HS_DONE_OFF);

    for (uint32_t i = 0; i < poll_limit; ++i) {
        if (*done == token) {
            host_fence();
            // Host도 이미 increment 완료한 뒤 이 함수를 호출한다고 가정
            *done = 0u; // clear
            host_fence();
            return 0;
        }
        if (poll_sleep_us) usleep(poll_sleep_us);
    }
    return -ETIMEDOUT;
}

// dma.lib.h의 cleanup()은 shared_mem free 순서가 애매할 수 있어서,
// 여기서는 "free_mem 먼저, close_dev 나중" 순서를 보장하는 cleanup을 따로 둠.
static void cleanup_all(dma_ctx_t *ctx)
{
    if (!ctx) return;

    // NOTE: free_mem은 close_dev 전에 해야 함.
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

int main(int argc, char **argv)
{
    const char *bdf = (argc >= 2) ? argv[1] : "0000:41:00.0";

    dma_ctx_t ctx = (dma_ctx_t){0};
    ctx.desc_memid   = -1;
    ctx.tx_memid     = -1;
    ctx.rx_memid     = -1;
    ctx.shared_memid = -1;

    int st = init_vfio(&ctx, bdf);
    if (st) {
        printf("init_vfio failed: %d\n", st);
        return 1;
    }

    // 1) 공유 메모리(=HPS가 보는 window) 할당: IOVA=0x0100_0000 고정
    st = alloc_shared_buffer(&ctx, (size_t)SHARED_BYTES, SHARED_IOVA_BASE);
    if (st) {
        printf("alloc_shared_buffer failed: %d\n", st);
        cleanup_all(&ctx);
        return 1;
    }

    // 공유 메모리 초기화(2MB면 부담 없음)
    memset(ctx.shared_va, 0, ctx.shared_bytes);
    host_fence();

    // 2) (선택) 기존 main.c와 동일하게 DMA 버퍼도 잡아둠(현재 shared-memory 경로에서는 사용 안 함)
    st = alloc_dma_buffers(&ctx, 4096, 4096, 4096);
    if (st) {
        printf("alloc_dma_buffers failed: %d\n", st);
        cleanup_all(&ctx);
        return 1;
    }

    printf("[shared] VA   = %p\n", (void *)ctx.shared_va);
    printf("[shared] IOVA = 0x%016" PRIx64 " (requested 0x%016" PRIx64 ")\n",
           ctx.shared_iova, (uint64_t)SHARED_IOVA_BASE);
    printf("[shared] size = 0x%zx bytes\n", ctx.shared_bytes);

    // HPS에서 접근할 주소(디버그용)
    uint64_t hps_target_addr = HPS_H2F_BASE + ctx.shared_iova + COUNTER_OFF;
    uint64_t hps_hs_base     = HPS_H2F_BASE + ctx.shared_iova + HS_BASE_OFF;
    printf("[HPS] TARGET_ADDR should be 0x%016" PRIx64 "\n", hps_target_addr);
    printf("[HPS] HS_BASE     should be 0x%016" PRIx64 "\n", hps_hs_base);

    printf("IOVA(desc) = 0x%016" PRIx64 "\n", ctx.desc_iova);
    printf("IOVA(tx)   = 0x%016" PRIx64 "\n", ctx.tx_iova);
    printf("IOVA(rx)   = 0x%016" PRIx64 "\n", ctx.rx_iova);

    const uint32_t token = 0xA5A50001u;

    printf("Handshake start (shared-mem): token=0x%08x\n", token);

    st = host_barrier_handshake_shared(ctx.shared_va, token,
                                       /*poll_limit=*/5000u,
                                       /*poll_sleep_us=*/1000u); // 1ms * 5000 = 5초
    if (st) {
        printf("handshake failed: %d\n", st);
        cleanup_all(&ctx);
        return 2;
    }

    printf("Handshake OK (GO sent). Start HOST increment: %u times\n", HOST_INC_COUNT);

    st = host_increment_n_times_shared(ctx.shared_va, HOST_INC_COUNT);
    if (st) {
        printf("host increment failed: %d\n", st);
        cleanup_all(&ctx);
        return 3;
    }

    printf("HOST increment done. Waiting HPS DONE...\n");

    st = host_wait_done_and_clear(ctx.shared_va, token,
                                  /*poll_limit=*/5000u,
                                  /*poll_sleep_us=*/1000u);
    if (st) {
        printf("wait DONE failed: %d\n", st);
        cleanup_all(&ctx);
        return 4;
    }

    volatile uint32_t * const counter = shm_u32_ptr(ctx.shared_va, COUNTER_OFF);
    uint32_t final = *counter;
    host_fence();

    printf("DONE seen+cleared. FINAL counter = 0x%08x (%u)\n", final, final);

    // (선택) 다음 실행을 위해 REQ/ACK/GO도 정리
    *shm_u32_ptr(ctx.shared_va, HS_REQ_OFF)  = 0u;
    *shm_u32_ptr(ctx.shared_va, HS_ACK_OFF)  = 0u;
    *shm_u32_ptr(ctx.shared_va, HS_GO_OFF)   = 0u;
    host_fence();

    cleanup_all(&ctx);
    return 0;
}