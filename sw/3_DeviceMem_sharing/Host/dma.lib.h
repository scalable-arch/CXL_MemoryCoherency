/*
 * dma.lib.h
 *
 * 이 헤더는 Host Linux 프로그램에서 FPGA의 DMA 엔진(QCSR 기반 MCDMA)을 제어하기 위해 사용하는
 * 공통 DMA/VFIO 유틸리티 모음이다.
 *
 * 큰 역할은 다음과 같다.
 * 1. VFIO를 통해 PCIe 디바이스를 열고 Bus Master를 활성화한다.
 * 2. Descriptor ring, TX buffer, RX buffer, shared buffer를 Host 메모리에 할당하고,
 *    각각의 VA / IOVA를 확보한다.
 * 3. BAR0에 매핑된 QCSR 레지스터를 통해 DMA queue를 reset / configure / enable 한다.
 * 4. H2D / D2H descriptor를 작성하고 doorbell을 눌러 DMA 전송을 시작한다.
 * 5. 완료 포인터를 polling하여 DMA 완료 여부를 확인한다.
 * 6. 테스트가 끝나면 할당한 메모리와 VFIO 디바이스 핸들을 정리한다.
 *
 */

// dma.lib.h

#ifndef DMA_LIB_H
#define DMA_LIB_H


#define _GNU_SOURCE
#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<inttypes.h>
#include<string.h>
#include<errno.h>
#include<unistd.h>
#include<linux/vfio.h>
#include <string.h>
#include"bwvfio.h"
#include <stdatomic.h>

/*
 * BAR / region selection
 * 현재 QCSR(control/status register) 공간이 BAR0에 매핑되어 있다고 가정한다.
 */
#define QCSR_REGION   VFIO_PCI_BAR0_REGION_INDEX

/*
 * QCSR address mapping
 * - direction(H2D / D2H)
 * - queue index
 * - register offset
 */
#define QCSR_BASE          0x000000u
#define QCSR_DIR_D2H       0u
#define QCSR_DIR_H2D       1u
#define QCSR_ADDR(dir,q,off) (QCSR_BASE + ((uint32_t)(dir) << 19) + ((uint32_t)(q) << 8) + (uint32_t)(off))

/*
 * QCSR register offsets
 *
 * DMA queue를 설정하고 실행하기 위해 사용하는 최소 register 집합이다.
 * - Q_CTRL: queue enable
 * - Q_START_ADDR_L/H: descriptor ring base address
 * - Q_SIZE: ring size(log2)
 * - Q_TAIL_PTR: doorbell 역할
 * - Q_HEAD_PTR: descriptor fetch 상태 확인
 * - Q_COMPLETED_PTR: DMA 완료 polling
 * - Q_RESET: queue reset
 */
#define Q_CTRL_OFF            0x00u
#define Q_START_ADDR_L_OFF    0x08u
#define Q_START_ADDR_H_OFF    0x0Cu
#define Q_SIZE_OFF            0x10u
#define Q_TAIL_PTR_OFF        0x14u
#define Q_HEAD_PTR_OFF        0x18u
#define Q_COMPLETED_PTR_OFF   0x1Cu
#define Q_RESET_OFF           0x48u

#define Q_CTRL_QEN            (1u << 0)

/*
 * Queue / descriptor 기본 파라미터
*/
#define QUEUE_ID              0u
#define RING_ORDER_LOG2       1u
#define DESC_IDX_FIRST        1u

/*
 * Descriptor / DMA 전송 관련 상수
 *
 * - descriptor 하나는 32 bytes
 * - DMA payload 최대 크기는 1MB
 * - PYLD_CNT field는 20-bit만 사용
 */
#define DESC_BYTES            32u
#define DMA_LEN_MAX_BYTES     (1u << 20)
#define DMA_PYLD_CNT_MASK     ((1u << 20) - 1u)

/*
 * 임시 device memory 주소
 */
#define DEV_DDR_BASE_TMP      0xDEAD0000ull
#define DEV_ADDR_TMP          (DEV_DDR_BASE_TMP + 0x1000ull)

/*
 * DMA context
 *
 * Host 쪽에서 DMA/VFIO 관련 상태를 한 번에 들고 다니기 위한 구조체이다.
 * 포함 내용:
 * - VFIO device handle
 * - descriptor / tx / rx buffer의 memid
 * - descriptor / tx / rx buffer의 Host VA
 * - descriptor / tx / rx buffer의 IOVA
 * - shared window 관련 memid / VA / IOVA / 크기
 *
 * 상위 main.c에서는 보통 이 구조체 하나를 선언한 뒤,
 * init_vfio(), alloc_dma_buffers(), alloc_shared_buffer() 등을 호출하면서 계속 전달한다.
 */
typedef struct {
    BWVFIODev dev;

int desc_memid, tx_memid, rx_memid;

void    *desc_va;
uint8_t *tx_va;
uint8_t *rx_va;

uint64_t desc_iova, tx_iova, rx_iova;

int      shared_memid;
uint8_t *shared_va;
uint64_t shared_iova;
size_t   shared_bytes;
} dma_ctx_t;

/*
 * 32-byte MCDMA descriptor container
 *
 * descriptor의 실제 필드는 byte array로 들고 있고,
 * 아래 helper 함수(desc_set_u64/u32)로 필요한 위치에 값을 써 넣는다.
 */
typedef struct {
    uint8_t b[32];
} mcdma_desc_t;

/*
 * descriptor 내부의 특정 byte offset에 64-bit 값을 기록하는 helper이다.
 * descriptor 포맷을 구조체 field로 직접 나누지 않고 raw byte array로 다루기 때문에 필요하다.
 */
static inline void desc_set_u64(mcdma_desc_t *d, size_t off, uint64_t v){
    memcpy(&d->b[off], &v, sizeof(v));
}

/*
 * descriptor 내부의 특정 byte offset에 32-bit 값을 기록하는 helper이다.
 * 현재 코드에서는 주로 u64 writer를 많이 사용하지만, 확장성을 위해 함께 둔다.
 */
static inline void desc_set_u32(mcdma_desc_t *d, size_t off, uint32_t v){
    memcpy(&d->b[off], &v, sizeof(v));
}

/*
 * DMA specification에 맞게 payload count를 인코딩한다.
 *
 * 규칙:
 * - 일반 길이는 그대로 사용
 * - 1MB는 특수값 0으로 표현
 *
 * 따라서 상위 코드에서 len_bytes를 받아 descriptor field에 넣기 전에
 * 이 helper를 한 번 거친다.
 */
static inline uint32_t encode_pyld_cnt(uint32_t len_bytes){
    if (len_bytes == DMA_LEN_MAX_BYTES) return 0;
    return len_bytes;
}

/*
 * descriptor write 이후, doorbell write 전에 write ordering을 보장하기 위한 barrier이다.
 *
 * 목적:
 * CPU가 descriptor 내용을 메모리에 다 써 넣기 전에
 * doorbell(Q_TAIL_PTR)을 먼저 쓰는 재정렬을 막는다.
 *
 * 즉, DMA engine이 descriptor를 읽기 시작할 때 descriptor 내용이 이미 완성되어 있도록 하기 위한 장치이다.
 */
static inline void doorbell_write_barrier(void) {
    atomic_thread_fence(memory_order_release);
}

/*
 * VFIO 디바이스를 열고 bus mastering을 활성화한다.
 *
 * 동작:
 * 1. bwvfio_open_dev()로 PCIe 디바이스 핸들을 획득
 * 2. bwvfio_set_bus_master(...,1)로 bus master enable
 *
 * 실패 시:
 * - bus master 설정에 실패하면 이미 열린 device handle을 닫고 에러를 반환한다.
 */
static inline int init_vfio(dma_ctx_t *ctx, const char *bdf){
    int vfio_init_status;
    if (!ctx || !bdf) return -1;
    vfio_init_status = bwvfio_open_dev(bdf, &ctx->dev);
    if (vfio_init_status) return vfio_init_status;
    vfio_init_status = bwvfio_set_bus_master(&ctx->dev,1);
    if (vfio_init_status) {
        bwvfio_close_dev(&ctx->dev);
        return vfio_init_status;
    }
return 0;
}

/*
 * size 값을 a 단위로 올림 정렬하는 helper이다.
 *
 * 주로 shared buffer / DMA buffer를 page boundary(예: 4KB) 기준으로 맞출 때 사용한다.
 */
static inline size_t align_up_sz(size_t x, size_t a) {
    return (x + (a - 1)) & ~(a - 1);
}

/*
 * shared buffer를 고정 IOVA로 할당한다.
 *
 * 용도:
 * - Host/HPS가 같은 메모리 영역을 공유하는 shared-memory 테스트에서 사용
 *
 * 동작:
 * 1. bytes를 page 크기(4KB) 기준으로 올림 정렬
 * 2. SHM + RW + IOVA 고정 옵션으로 VFIO memory object 할당
 * 3. 해당 memory의 Host VA와 IOVA를 얻어 ctx에 저장
 *
 * 실패 시:
 * - 이미 할당한 shared mem이 있다면 free
 * - ctx의 shared 관련 필드를 초기 상태로 되돌림
 */
static inline int alloc_shared_buffer(dma_ctx_t *ctx, size_t bytes, uint64_t iova_base)
{
    int alloc_shared_status;
    BWVFIOMemAttr attr = {0};
    const size_t PAGE = 4096;

    if (!ctx || bytes == 0) return -1;

    size_t map_sz = align_up_sz(bytes, PAGE);

    attr.flags = BWVFIO_DMF_SHM | BWVFIO_DMF_SHM_CREATE | BWVFIO_DMF_RW | BWVFIO_DMF_IOVA;
    attr.iova  = iova_base;

    alloc_shared_status = bwvfio_alloc_mem(&ctx->dev, map_sz, &attr, &ctx->shared_memid);
    if (alloc_shared_status) goto fail;

    void *tmp_va = NULL;
    alloc_shared_status = bwvfio_get_mem_va(&ctx->dev, ctx->shared_memid, &tmp_va);
    if (alloc_shared_status) goto fail;
    ctx->shared_va = (uint8_t *)tmp_va;

    alloc_shared_status = bwvfio_get_mem_iova(&ctx->dev, ctx->shared_memid, &ctx->shared_iova);
    if (alloc_shared_status) goto fail;

    ctx->shared_bytes = map_sz;
    return 0;

fail:
    if (ctx->shared_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, ctx->shared_memid);
    }
    ctx->shared_memid = -1;
    ctx->shared_va = NULL;
    ctx->shared_iova = 0;
    ctx->shared_bytes = 0;
    return alloc_shared_status;
}

/*
 * descriptor ring, TX buffer, RX buffer를 순서대로 할당하고,
 * 각 buffer의 VA와 IOVA를 ctx에 저장한다.
 *
 * 특징:
 * - 모든 buffer를 page-aligned 크기로 맞춘다.
 * - IOVA를 명시적으로 강제 지정한다.
 * - shared buffer가 이미 존재하면, shared window 끝 다음 주소부터 DMA buffer를 배치한다.
 *
 * 의미:
 * - descriptor ring은 DMA engine이 읽는 queue metadata 공간
 * - TX buffer는 Host -> Device 전송 payload source
 * - RX buffer는 Device -> Host 전송 payload destination
 *
 * 실패 시:
 * - 부분적으로 할당된 buffer를 역순으로 정리하고 에러 반환
 */
static inline int alloc_dma_buffers(dma_ctx_t *ctx, size_t desc_ring_bytes, size_t tx_bytes, size_t rx_bytes){
    int alloc_dma_buffers_status;
    BWVFIOMemAttr attr = {0};
    if (!ctx) return -1;

    const size_t PAGE = 4096;
    #define ALIGN_UP(x,a) (((x)+((a)-1)) & ~((a)-1))

    attr.flags = BWVFIO_DMF_SHM | BWVFIO_DMF_SHM_CREATE | BWVFIO_DMF_RW | BWVFIO_DMF_IOVA;

    uint64_t next_iova = 0x01000000ull;
    if (ctx->shared_iova != 0 && ctx->shared_bytes != 0) {
        next_iova = ctx->shared_iova + ctx->shared_bytes;
    }

    size_t desc_sz = ALIGN_UP(desc_ring_bytes, PAGE);
    attr.iova = next_iova;
    alloc_dma_buffers_status = bwvfio_alloc_mem(&ctx->dev, desc_sz, &attr, &ctx->desc_memid);
    if (alloc_dma_buffers_status) goto fail;
    next_iova += desc_sz;

    alloc_dma_buffers_status = bwvfio_get_mem_va(&ctx->dev, ctx->desc_memid, &ctx->desc_va);
    if (alloc_dma_buffers_status) goto fail;
    alloc_dma_buffers_status = bwvfio_get_mem_iova(&ctx->dev, ctx->desc_memid, &ctx->desc_iova);
    if (alloc_dma_buffers_status) goto fail;

    if (tx_bytes) {
        size_t tx_sz = ALIGN_UP(tx_bytes, PAGE);
        attr.iova = next_iova;
        alloc_dma_buffers_status = bwvfio_alloc_mem(&ctx->dev, tx_sz, &attr, &ctx->tx_memid);
        if (alloc_dma_buffers_status) goto fail;
        next_iova += tx_sz;

        void *tmp_va = NULL;
        alloc_dma_buffers_status = bwvfio_get_mem_va(&ctx->dev, ctx->tx_memid, &tmp_va);
        if (alloc_dma_buffers_status) goto fail;
        ctx->tx_va = (uint8_t *)tmp_va;

        alloc_dma_buffers_status = bwvfio_get_mem_iova(&ctx->dev, ctx->tx_memid, &ctx->tx_iova);
        if (alloc_dma_buffers_status) goto fail;
    }

    if (rx_bytes) {
        size_t rx_sz = ALIGN_UP(rx_bytes, PAGE);
        attr.iova = next_iova;
        alloc_dma_buffers_status = bwvfio_alloc_mem(&ctx->dev, rx_sz, &attr, &ctx->rx_memid);
        if (alloc_dma_buffers_status) goto fail;
        next_iova += rx_sz;

        void *tmp_va = NULL;
        alloc_dma_buffers_status = bwvfio_get_mem_va(&ctx->dev, ctx->rx_memid, &tmp_va);
        if (alloc_dma_buffers_status) goto fail;
        ctx->rx_va = (uint8_t *)tmp_va;

        alloc_dma_buffers_status = bwvfio_get_mem_iova(&ctx->dev, ctx->rx_memid, &ctx->rx_iova);
        if (alloc_dma_buffers_status) goto fail;
    }

    return 0;

    fail:
    if (ctx->rx_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, ctx->rx_memid);
        ctx->rx_memid = -1;
        ctx->rx_va = NULL;
        ctx->rx_iova = 0;
    }
    if (ctx->tx_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, ctx->tx_memid);
        ctx->tx_memid = -1;
        ctx->tx_va = NULL;
        ctx->tx_iova = 0;
    }
    if (ctx->desc_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, ctx->desc_memid);
        ctx->desc_memid = -1;
        ctx->desc_va = NULL;
        ctx->desc_iova = 0;
    }
    return alloc_dma_buffers_status;
}

/*
 * DMA queue를 초기화한다.
 *
 * 수행 내용:
 * 1. Q_RESET을 써서 queue reset
 * 2. reset bit가 0이 될 때까지 polling
 * 3. descriptor ring base address(64-bit)를 start address L/H에 기록
 * 4. ring size(log2)를 Q_SIZE에 기록
 * 5. Q_CTRL의 enable bit를 세워 queue를 활성화
 *
 */
static inline int qcsr_init_queue(dma_ctx_t *ctx, int dir, uint32_t q, uint64_t desc_iova, uint32_t ring_order_log2){
    int qcsr_init_status;
    uint32_t reset_val = 0;

    if (!ctx) return -1;
    if (desc_iova == 0) return -1;
    if (ring_order_log2 < 1 || ring_order_log2 > 16) return -1;

    qcsr_init_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_RESET_OFF), 1);
    if (qcsr_init_status) return qcsr_init_status;

    do {
        qcsr_init_status = bwvfio_ms_read32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_RESET_OFF), &reset_val);
        if (qcsr_init_status) return qcsr_init_status;
    } while (reset_val != 0);

    qcsr_init_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_START_ADDR_L_OFF), (uint32_t)(desc_iova & 0xffffffffu));
    if (qcsr_init_status) return qcsr_init_status;

    qcsr_init_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_START_ADDR_H_OFF), (uint32_t)(desc_iova >> 32));
    if (qcsr_init_status) return qcsr_init_status;

    qcsr_init_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_SIZE_OFF), ring_order_log2);
    if (qcsr_init_status) return qcsr_init_status;

    qcsr_init_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_CTRL_OFF), Q_CTRL_QEN);
    if (qcsr_init_status) return qcsr_init_status;

    return 0;
}

/*
 * H2D descriptor 하나를 descriptor ring에 작성한다.
 *
 * 의미:
 * - source address  = Host TX buffer IOVA
 * - destination     = device memory address
 * - payload count   = len
 * - descriptor idx  = desc_idx
 *
 * descriptor ring에서 desc_idx번째 slot을 계산한 뒤,
 * 해당 위치에 DMA engine이 읽을 수 있는 descriptor 포맷으로 값을 채운다.
 */
static inline int write_desc_h2d(dma_ctx_t *ctx, uint32_t desc_idx, uint64_t dev_dst_addr, uint32_t len){
    int write_desc_h2d_status = 0;
    if (!ctx) return -1;
    if (!ctx->desc_va) return -1;
    if (ctx->tx_iova == 0) return -1;
    if (desc_idx == 0) return -1;
    if (len == 0 || len > DMA_LEN_MAX_BYTES) return -1;
    uint32_t ring_entries = (1u << RING_ORDER_LOG2);
    if (desc_idx >= ring_entries) return -1;

    mcdma_desc_t *slot = (mcdma_desc_t *)((uint8_t *)ctx->desc_va + (uint64_t)(desc_idx - 1) * DESC_BYTES);

    memset(slot, 0, sizeof(*slot));

    desc_set_u64(slot, 0x00, ctx->tx_iova);

    desc_set_u64(slot, 0x08, dev_dst_addr);

    uint32_t pyld_cnt = encode_pyld_cnt(len) & DMA_PYLD_CNT_MASK;
    uint64_t w2 = ((uint64_t)pyld_cnt << 0) | ((uint64_t)(desc_idx & 0xFFFFu) << 32);
    desc_set_u64(slot, 0x10, w2);

    desc_set_u64(slot, 0x18, 0ull);

    return write_desc_h2d_status;
}

/*
 * D2H descriptor 하나를 descriptor ring에 작성한다.
 *
 * 의미:
 * - source address  = device memory address
 * - destination     = Host RX buffer IOVA
 * - payload count   = len
 * - descriptor idx  = desc_idx
 *
 */
static inline int write_desc_d2h(dma_ctx_t *ctx, uint32_t desc_idx, uint64_t dev_src_addr, uint32_t len){
    int write_desc_d2h_status = 0;
    if (!ctx) return -1;
    if (!ctx->desc_va) return -1;
    if (ctx->rx_iova == 0) return -1;
    if (desc_idx == 0) return -1;
    if (len == 0 || len > DMA_LEN_MAX_BYTES) return -1;
    uint32_t ring_entries = (1u << RING_ORDER_LOG2);
    if (desc_idx >= ring_entries) return -1;

    const uint32_t descs_per_page = (4096u / DESC_BYTES);
    if (descs_per_page && ((desc_idx % descs_per_page) == 0))
        return -1;

    mcdma_desc_t *slot = (mcdma_desc_t *)((uint8_t *)ctx->desc_va + (uint64_t)(desc_idx - 1) * DESC_BYTES);

    memset(slot, 0, sizeof(*slot));

    desc_set_u64(slot, 0x00, dev_src_addr);

    desc_set_u64(slot, 0x08, ctx->rx_iova);

    uint32_t pyld_cnt = encode_pyld_cnt(len) & DMA_PYLD_CNT_MASK;
    uint64_t w2 = ((uint64_t)pyld_cnt << 0) | ((uint64_t)(desc_idx & 0xFFFFu) << 32);
    desc_set_u64(slot, 0x10, w2);

    desc_set_u64(slot, 0x18, 0ull);

    return write_desc_d2h_status;
}

/*
 * doorbell 함수는 queue의 tail pointer를 갱신하여
 * "새로운 descriptor가 준비되었으니 DMA를 시작하라"는 신호를 HW에 보내는 역할을 한다.
 */
static inline int doorbell(dma_ctx_t *ctx, int dir, uint32_t q, uint32_t tail_idx){
    int doorbell_status = 0;
    uint32_t ring_entries = (1u << RING_ORDER_LOG2);
    if (!ctx) return -1;
    if (tail_idx == 0 || tail_idx >= ring_entries) return -1;
    doorbell_write_barrier();
    doorbell_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_TAIL_PTR_OFF), tail_idx);
    if (doorbell_status) return doorbell_status;

    return 0;
}

/*
 * 특정 descriptor index가 완료될 때까지 polling하는 함수이다.
 *
 * 확인하는 내용:
 * 1. Q_HEAD_PTR를 읽어 descriptor fetch 에러 여부 확인
 * 2. Q_COMPLETED_PTR를 읽어 마지막 완료 descriptor index 확인
 * 3. target_idx 이상이 완료되면 loop 종료
 *
 *
 * 성공 후 acquire barrier를 수행하여,
 * 이후 상위 코드가 RX buffer나 결과 데이터를 읽을 때 DMA 완료 이전의 stale 값이 아닌
 * 최신 완료 데이터를 보도록 한다.
 */
static inline int poll_complete(dma_ctx_t *ctx, int dir, uint32_t q, uint32_t target_idx, uint32_t *completed_idx_out /* optional: NULL 허용 */){
    int poll_complete_status = 0;
    uint32_t ring_entries = (1u << RING_ORDER_LOG2);
    uint32_t completed_reg_off = 0;
    uint32_t completed_val = 0;
    uint32_t head_reg_off = 0;
    uint32_t head_val = 0;
    if (!ctx) return -1;
    if (target_idx ==0 || target_idx >= ring_entries) return -1;
    completed_reg_off = QCSR_ADDR(dir, q, Q_COMPLETED_PTR_OFF);
    head_reg_off = QCSR_ADDR(dir, q, Q_HEAD_PTR_OFF);
    while(1) {
        poll_complete_status = bwvfio_ms_read32(&ctx->dev, QCSR_REGION, head_reg_off, &head_val);
        if (poll_complete_status) return poll_complete_status;
        uint32_t desc_fetch_err = ((head_val >> 24) & 0x1u);
        if (desc_fetch_err) return -EIO;

        poll_complete_status = bwvfio_ms_read32(&ctx->dev, QCSR_REGION, completed_reg_off, &completed_val);
        if (poll_complete_status) return poll_complete_status;

        uint32_t completed_idx = (completed_val & 0xFFFFu);
        uint32_t h2d_err = ((completed_val >> 24) & 0x1u);
        if (dir == QCSR_DIR_H2D && h2d_err) return -EIO;

        if (completed_idx_out) *completed_idx_out = completed_idx;
        if (completed_idx >= target_idx) break;
    }
    atomic_thread_fence(memory_order_acquire);

    return 0;
}

/*
 * cleanup 함수는 지금까지 할당한 DMA/shared buffer를 해제하고,
 * 마지막으로 VFIO device handle을 닫는 정리 함수이다.
 *
 * 하는 일:
 * - desc/tx/rx/shared mem free
 * - VA / IOVA / size 필드 초기화
 * - VFIO close
 *
 */
static inline void cleanup(dma_ctx_t *ctx){
    if (!ctx) return;
    if (ctx->desc_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, ctx->desc_memid);
        ctx->desc_memid = -1;
    }
    if (ctx->tx_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, ctx->tx_memid);
        ctx->tx_memid = -1;
    }
    if (ctx->rx_memid >= 0) {
        (void)bwvfio_free_mem(&ctx->dev, ctx->rx_memid);
        ctx->rx_memid = -1;
    }

    ctx->desc_va = NULL;
    ctx->tx_va   = NULL;
    ctx->rx_va   = NULL;

    ctx->desc_iova = 0;
    ctx->tx_iova   = 0;
    ctx->rx_iova   = 0;

    bwvfio_close_dev(&ctx->dev);

    if (ctx->shared_memid >= 0) {
    (void)bwvfio_free_mem(&ctx->dev, ctx->shared_memid);
    ctx->shared_memid = -1;
    }
    ctx->shared_va = NULL;
    ctx->shared_iova = 0;
    ctx->shared_bytes = 0;
}

#endif // DMA_LIB_H