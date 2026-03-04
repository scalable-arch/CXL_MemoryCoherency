// dma.lib.h

#ifndef DMA_LIB_H
#define DMA_LIB_H

// linux/vfio.h, bwvfio.h 헤더와 같이 사용

#define _GNU_SOURCE
#include<stdio.h>// printf, fprintf
#include<stdlib.h>// exit, malloc/free(필요시), strtoull
#include<stdint.h>// uint32_t/uint64_t 등 고정폭 타입
#include<inttypes.h>// PRIu64/PRIx64 등 포맷 매크로(주소 출력)
#include<string.h>// memset, strerror
#include<errno.h>// errno 값/에러 처리
#include<unistd.h>// usleep, close (필요시)
#include<linux/vfio.h>// VFIO_PCI_BAR0_REGION_INDEX 등 BAR region index 상수 -> Ubuntu에 설치되어 있어야 하며 없으면 헤더 패키지 설치 필요
#include <string.h>
#include"bwvfio.h"// BWVFIODev, BWVFIOMemAttr, bwvfio_* API
#include <stdatomic.h> // atomic_thread_fence() (barrier)


// ---- 1) BAR/Region 선택 ----
#define QCSR_REGION   VFIO_PCI_BAR0_REGION_INDEX// 이건 아직 임시값, 문서 기준 QCSR는 BAR0에 매핑된다고 가정

// ---- 2) QCSR 주소 계산(문서의 비트 규칙을 코드 매크로로) ----
#define QCSR_BASE          0x000000u
#define QCSR_DIR_D2H       0u // Address[19]: 0 = D2H, 1 = H2D
#define QCSR_DIR_H2D       1u
// dir 방향(H2D/D2H)의 q번 큐에 있는 OFF 레지스터가 위치한 BAR 내부 offset을 계산
#define QCSR_ADDR(dir,q,off) (QCSR_BASE + ((uint32_t)(dir) << 19) + ((uint32_t)(q) << 8) + (uint32_t)(off)) // Multi-channel DMA 의 주소 매핑 규칙을 구현한 매크로

// ---- 3) QCSR 레지스터 오프셋(우리가 쓰는 최소 셋, MMIO로 접근할 때 사용 ex.bwvfio ) ----
#define Q_CTRL_OFF            0x00u
#define Q_START_ADDR_L_OFF    0x08u
#define Q_START_ADDR_H_OFF    0x0Cu
#define Q_SIZE_OFF            0x10u
#define Q_TAIL_PTR_OFF        0x14u// doorbell
#define Q_HEAD_PTR_OFF        0x18u// descriptor fetch head pointer
#define Q_COMPLETED_PTR_OFF   0x1Cu// 폴링용
#define Q_RESET_OFF           0x48u

// ---- 4) Q_CTRL 비트(최소) ----
#define Q_CTRL_QEN            (1u << 0)

// ---- 5) Descriptor/Ring 기본 파라미터(임시값) ----
#define QUEUE_ID              0u// 일단 0번 큐로 시작
#define RING_ORDER_LOG2       1u// 프로토타입: 2^1 = 2 엔트리(최소). desc_idx=1만 사용해서 검증
#define DESC_IDX_FIRST        1u// descriptor index는 1부터 시작(0 쓰지 않기)

#define DESC_BYTES            32u                 // 32B : descriptor 1개 size
#define DMA_LEN_MAX_BYTES     (1u << 20)          // 1MB : DMA payload의 max_size (Data size)
#define DMA_PYLD_CNT_MASK     ((1u << 20) - 1u)   // 20-bit : PYLD_CNT 20bit를 64bit word에 패킹할 때 상위 bit가 섞이지 않도록 마스킹

// ---- 6) 임시 device DDR 주소(아직 NoC 미완성이라 상수로) ----
#define DEV_DDR_BASE_TMP      0xDEAD0000ull
#define DEV_ADDR_TMP          (DEV_DDR_BASE_TMP + 0x1000ull)


// descriptor/buffer pointer 구조체 선언
// VFIO 디바이스 핸들, Host 메모리 객체, Host VA, IOVA(DMA 주소) 등, main에서 한 번 선언한 다음 계속 사용
typedef struct {
    BWVFIODev dev;

int desc_memid, tx_memid, rx_memid;

void    *desc_va;
uint8_t *tx_va;
uint8_t *rx_va;

uint64_t desc_iova, tx_iova, rx_iova;

// (추가) shared window
int      shared_memid;
uint8_t *shared_va;
uint64_t shared_iova;
size_t   shared_bytes;   // 매핑된 크기(4KB align 권장)
} dma_ctx_t;

// 256-bit(32B) descriptor layout (word 기준)
// [0x00..0x07] SRC_ADDR   (u64)
// [0x08..0x0F] DEST_ADDR  (u64)
// [0x10..0x17] w2: PYLD_CNT[19:0] at bit[0], DESC_IDX at bit[32] (u64)
// [0x18..0x1F] w3: 0 (옵션/예약 비트는 0으로 둠)
typedef struct {
    uint8_t b[32];
} mcdma_desc_t;

static inline void desc_set_u64(mcdma_desc_t *d, size_t off, uint64_t v){
    memcpy(&d->b[off], &v, sizeof(v));
}

static inline void desc_set_u32(mcdma_desc_t *d, size_t off, uint32_t v){
    memcpy(&d->b[off], &v, sizeof(v));
}

// document 특별 규칙(max_size = 1MB는 PYLD_CNT = 0으로 표현)
static inline uint32_t encode_pyld_cnt(uint32_t len_bytes){
    // spec: 20'h0 indicates 1MB
    if (len_bytes == DMA_LEN_MAX_BYTES) return 0;
    return len_bytes; // 1..(1MB-1)
}

// write barrier (주의 : non-coherent DMA 환경에서는 부족)
static inline void doorbell_write_barrier(void) {
    atomic_thread_fence(memory_order_release); // 컴파일러/CPU가 항상 descriptor write 동작을 doorbell write 동작보다 앞에 두게끔 강제
}


//step별 함수 선언
/*
 * 함수(step)별 기능
 * init_vfio()          : bwvfio/VFIO로 PCIe 디바이스를 열고, DMA를 위해 Bus Master를 활성화한다.
 * alloc_dma_buffers()  : SHM 기반 Host 버퍼(Descriptor Ring + TX/RX payload)를 할당하고 VA/IOVA를 확보한다.
 * qcsr_init_queue()    : H2D/D2H 방향에 대해 DMA 큐 레지스터(Q_RESET, Q_START_ADDR, Q_SIZE, Q_CTRL)를 설정한다.
 * write_desc_h2d/d2h() : Host의 Descriptor Ring에 descriptor 1개를 작성(src/dst/len/idx).
 * doorbell()           : Q_TAIL_POINTER에 마지막 유효 descriptor index를 써서 DMA를 트리거한다.
 * poll_complete()      : Q_COMPLETED_POINTER를 폴링하여 target index의 완료를 확인한다.
 * cleanup()            : 할당한 버퍼를 해제하고 VFIO 디바이스 핸들을 닫는다.
 */


// 1) VFIO 초기화(open + bus master)
static inline int init_vfio(dma_ctx_t *ctx, const char *bdf){
    int vfio_init_status;                                  // main에서 디버깅 위한 status 변수
    if (!ctx || !bdf) return -1;                           // ctx = NULL or bdf = NULL -> error
    vfio_init_status = bwvfio_open_dev(bdf, &ctx->dev);    // device 핸들 획득 (정상종료시 0 return)
    if (vfio_init_status) return vfio_init_status;         // 디버깅 1
    vfio_init_status = bwvfio_set_bus_master(&ctx->dev,1); //bus matster 활성화 (정상종료시 0 return)
    if (vfio_init_status) {
        bwvfio_close_dev(&ctx->dev);                       // VFIO 획득 후 리소스 정리;
        return vfio_init_status;                           //디버깅 2
    }
return 0;
}

// shared용
static inline size_t align_up_sz(size_t x, size_t a) {
    return (x + (a - 1)) & ~(a - 1);
}

// shared buffer alloc (DMA desc/tx/rx와 별개)
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

// 2) DMA용 Host 버퍼/descriptor ring 할당 + VA/IOVA 확보
static inline int alloc_dma_buffers(dma_ctx_t *ctx, size_t desc_ring_bytes, size_t tx_bytes, size_t rx_bytes){
    int alloc_dma_buffers_status;
    BWVFIOMemAttr attr = {0};
    if (!ctx) return -1;

    // (추가) 4KB 정렬 권장 (VFIO_IOMMU_MAP_DMA가 보통 page 정렬 요구)
    const size_t PAGE = 4096;
    #define ALIGN_UP(x,a) (((x)+((a)-1)) & ~((a)-1))

    // (변경 1) BWVFIO_DMF_IOVA 추가
    attr.flags = BWVFIO_DMF_SHM | BWVFIO_DMF_SHM_CREATE | BWVFIO_DMF_RW | BWVFIO_DMF_IOVA;

    uint64_t next_iova = 0x01000000ull; // shared를 안 쓰면 기존처럼 여기서 시작
    if (ctx->shared_iova != 0 && ctx->shared_bytes != 0) {
        next_iova = ctx->shared_iova + ctx->shared_bytes; // shared 끝 다음부터 DMA 배치
    }

    // 2-1) Descriptor ring
    size_t desc_sz = ALIGN_UP(desc_ring_bytes, PAGE);
    attr.iova = next_iova;                      // ★ 여기서 강제 IOVA 지정
    alloc_dma_buffers_status = bwvfio_alloc_mem(&ctx->dev, desc_sz, &attr, &ctx->desc_memid);
    if (alloc_dma_buffers_status) goto fail;
    next_iova += desc_sz;

    alloc_dma_buffers_status = bwvfio_get_mem_va(&ctx->dev, ctx->desc_memid, &ctx->desc_va);
    if (alloc_dma_buffers_status) goto fail;
    alloc_dma_buffers_status = bwvfio_get_mem_iova(&ctx->dev, ctx->desc_memid, &ctx->desc_iova);
    if (alloc_dma_buffers_status) goto fail;

    // 2-2) TX
    if (tx_bytes) {
        size_t tx_sz = ALIGN_UP(tx_bytes, PAGE);
        attr.iova = next_iova;                  // ★ TX IOVA 강제
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

    // 2-3) RX
    if (rx_bytes) {
        size_t rx_sz = ALIGN_UP(rx_bytes, PAGE);
        attr.iova = next_iova;                  // ★ RX IOVA 강제
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
    //host user-space에서 bwvfio로 할당한 SHM 메모리 객체(memid)를 해제 (중간 실패 시 메모리 누수 방지)
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

// 3) QCSR 큐 초기화(Q_RESET, Q_START_ADDR, Q_SIZE, Q_CTRL)
// alloc으로 할당해 놓은 descriptor ring 공간을 DMA queue에 연결 + queue enable로 DMA가 읽을 수 있게 만듦
static inline int qcsr_init_queue(dma_ctx_t *ctx, int dir, uint32_t q, uint64_t desc_iova, uint32_t ring_order_log2){
    int qcsr_init_status;
    uint32_t reset_val = 0;  // QCSR의 Q_RESET 레지스터를 MMIO로 읽어 온 값을 담아두는 로컬 변수

    // guard
    if (!ctx) return -1;
    if (desc_iova == 0) return -1;
    if (ring_order_log2 < 1 || ring_order_log2 > 16) return -1;

    // reset 요청
    qcsr_init_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_RESET_OFF), 1); // VFIO 핸들로 접근하여 QCSR region의 Q_RESET_OFF 주소에 1 write
    if (qcsr_init_status) return qcsr_init_status;

    // reset 완료 대기
    do {
        qcsr_init_status = bwvfio_ms_read32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_RESET_OFF), &reset_val); // VFIO 핸들로 접근해 QCSR 영역의 reset offset 값을 읽어서 reset_val 변수 주소에 저장
        if (qcsr_init_status) return qcsr_init_status;
    } while (reset_val != 0);

    // Descriptor ring(현재는 ring= 1 descriptor)의 IOVA를 QCSR에 등록
    // base 주소가 64bit인데, QCSR register가 32bit로 나뉘어 있어서 64bit 주소를 두 개의 register에 저장
    qcsr_init_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_START_ADDR_L_OFF), (uint32_t)(desc_iova & 0xffffffffu)); //하위 32bit 추출해서 저장
    if (qcsr_init_status) return qcsr_init_status;

    qcsr_init_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_START_ADDR_H_OFF), (uint32_t)(desc_iova >> 32)); // 상위 32bit 추출해서 저장
    if (qcsr_init_status) return qcsr_init_status;

    // ring size
    qcsr_init_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_SIZE_OFF), ring_order_log2);
    if (qcsr_init_status) return qcsr_init_status;

    // queue enable
    qcsr_init_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_CTRL_OFF), Q_CTRL_QEN); // Ctrl register의
    if (qcsr_init_status) return qcsr_init_status;

    return 0;
}

// 4) descriptor 1개 작성(H2D / D2H)
static inline int write_desc_h2d(dma_ctx_t *ctx, uint32_t desc_idx, uint64_t dev_dst_addr, uint32_t len){
    int write_desc_h2d_status = 0;
    // guard
    if (!ctx) return -1;                        // context pointer 검사
    if (!ctx->desc_va) return -1;               // Host VA(descriptor ring이 할당된) 검사
    if (ctx->tx_iova == 0) return -1;          // H2D payload IOVA 검사 (DMA가 read할 src_addr)
    if (desc_idx == 0) return -1; // desc_idx 검사 (0은 불가능)
    if (len == 0 || len > DMA_LEN_MAX_BYTES) return -1; //전송 길이 유효 검사 (max = 1MB는 PYLD_CNT=0으로 인코딩)
    uint32_t ring_entries = (1u << RING_ORDER_LOG2); // ring 엔트리 수는 2^RING_ORDER_LOG2라고 가정(alloc과 반드시 일치해야 함)
    if (desc_idx >= ring_entries) return -1;    // slot_ptr가 ring 밖을 가리키는 상황 방지

    // (옵션) 기본 정렬 모드에서 DWORD 정렬 요구 시 사용
    // if ((dev_dst_addr & 0x3ull) != 0) return -1;
    // if ((ctx->tx_iova  & 0x3ull) != 0) return -1;
    // if ((len & 0x3u) != 0) return -1;


    // ring에서 desc_idx번째 descriptor가 들어갈 메모리 위치를 계산 + 이후 write(desc_set)에서 해당 descriptor를 가리키는 주소로 사용 (descriptor 단위로 최종 typecasting)
    mcdma_desc_t *slot = (mcdma_desc_t *)((uint8_t *)ctx->desc_va + (uint64_t)(desc_idx - 1) * DESC_BYTES); // desc_idx는 1부터 시작하므로 slot 오프셋은 (desc_idx - 1)

    // slot 초기화(이전 descriptor 값 제거)
    memset(slot, 0, sizeof(*slot));

    // SRC_ADDR[63:0] write = Host payload buffer IOVA (DMA가 PCIe MemRd/MemWr을 발행할 때 사용하는 DMA 주소)
    desc_set_u64(slot, 0x00, ctx->tx_iova); //이 offset들은 descriptor의 bit format을 byte offset으로 변환한 값 (ex. SRC_ADDR [63:0] -> 0x00...0x07 )

    // DEST_ADDR = device memory address ( DEV_ADDR_TMP = 임시값/추후 NoC 확정 후 교체)
    desc_set_u64(slot, 0x08, dev_dst_addr);

    // w2 = PYLD_CNT + DESC_IDX 패킹 : PYLD_CNT: bits[19:0] + DESC_IDX: bits[47:32] 만 매핑(나머지는 0 = writeback/interrupt 미사용)
    uint32_t pyld_cnt = encode_pyld_cnt(len) & DMA_PYLD_CNT_MASK;
    uint64_t w2 = ((uint64_t)pyld_cnt << 0) | ((uint64_t)(desc_idx & 0xFFFFu) << 32);
    desc_set_u64(slot, 0x10, w2);


    // w3는 0 유지 (LINK/DESC_INVALID/SOF/EOF 등 미사용)
    desc_set_u64(slot, 0x18, 0ull);

    // doorbell 직전에 mfence 같은 write barrier를 두는 걸 권장.
    return write_desc_h2d_status;
}

static inline int write_desc_d2h(dma_ctx_t *ctx, uint32_t desc_idx, uint64_t dev_src_addr, uint32_t len){
    int write_desc_d2h_status = 0;
    // guard
    if (!ctx) return -1;
    if (!ctx->desc_va) return -1;
    if (ctx->rx_iova == 0) return -1;          // D2H payload IOVA 검사 (DMA가 write할 descriptor(host 메모리)의 주소)
    if (desc_idx == 0) return -1;              // descriptor ring 내부 descriptor의 index
    if (len == 0 || len > DMA_LEN_MAX_BYTES) return -1;
    uint32_t ring_entries = (1u << RING_ORDER_LOG2);
    if (desc_idx >= ring_entries) return -1;

    // (옵션) 기본 정렬 모드에서 DWORD 정렬 요구 시 사용
    // if ((dev_dst_addr & 0x3ull) != 0) return -1;
    // if ((ctx->tx_iova  & 0x3ull) != 0) return -1;
    // if ((len & 0x3u) != 0) return -1;

    // DMA IP spec상 HW는 descriptor 128개(=4KB page)를 한 묶음으로 보고, 그 묶음의 마지막 entry(128번째)는 Link descriptor
    // ring을 여러 4KB page로 확장할 경우를 대비해 link 슬롯(128,256,...)을 데이터로 덮어쓰지 않도록 방어
    const uint32_t descs_per_page = (4096u / DESC_BYTES); // 4096/32 = 128
    if (descs_per_page && ((desc_idx % descs_per_page) == 0))
        return -1;

    // ring에서 desc_idx번째 descriptor가 들어갈 메모리 위치를 계산(descriptor를 가리키는 주소)
    mcdma_desc_t *slot = (mcdma_desc_t *)((uint8_t *)ctx->desc_va + (uint64_t)(desc_idx - 1) * DESC_BYTES);

    // slot 초기화(이전 descriptor 값 제거)
    memset(slot, 0, sizeof(*slot));

    // SRC_ADDR write = device memory address ( DEV_ADDR_TMP = 임시값/추후 NoC 확정 후 교체)
    desc_set_u64(slot, 0x00, dev_src_addr);

    // DEST_ADDR write = Host payload buffer IOVA (DMA가 write할 descriptor(host 메모리)의 주소)
    desc_set_u64(slot, 0x08, ctx->rx_iova);

    // w2 = PYLD_CNT + DESC_IDX 패킹 : PYLD_CNT: bits[19:0] + DESC_IDX: bits[47:32] 만 매핑(나머지는 0 = writeback/interrupt 미사용)
    uint32_t pyld_cnt = encode_pyld_cnt(len) & DMA_PYLD_CNT_MASK;
    uint64_t w2 = ((uint64_t)pyld_cnt << 0) | ((uint64_t)(desc_idx & 0xFFFFu) << 32);
    desc_set_u64(slot, 0x10, w2);

    // w3는 0 유지 (LINK/DESC_INVALID/SOF/EOF 등 미사용)
    desc_set_u64(slot, 0x18, 0ull);

    // doorbell 직전에 mfence 같은 write barrier를 두는 걸 권장.
    return write_desc_d2h_status;
}

// 5) doorbell(Q_TAIL_POINTER write)
static inline int doorbell(dma_ctx_t *ctx, int dir, uint32_t q, uint32_t tail_idx){
    int doorbell_status = 0;
    uint32_t ring_entries = (1u << RING_ORDER_LOG2); // ring 크기 계산용 변수
    // guard
    if (!ctx) return -1;
    if (tail_idx == 0 || tail_idx >= ring_entries) return -1;   // 0 금지 + ring 범위 체크
    // memory barrier : 이와 별개로 상위 코드에서 tx_va/rx_va payload 내용을 먼저 채운 뒤 descriptor write -> doorbell 순서로 호출을 보장해야 함
    doorbell_write_barrier();
    // write tail_idx
    doorbell_status = bwvfio_ms_write32(&ctx->dev, QCSR_REGION, QCSR_ADDR(dir, q, Q_TAIL_PTR_OFF), tail_idx);
    if (doorbell_status) return doorbell_status;

    return 0;
}

// 6) 완료 폴링(Q_COMPLETED_POINTER)
static inline int poll_complete(dma_ctx_t *ctx, int dir, uint32_t q, uint32_t target_idx, uint32_t *completed_idx_out /* optional: NULL 허용 */){
    int poll_complete_status = 0;
    uint32_t ring_entries = (1u << RING_ORDER_LOG2); // ring 크기 계산용 변수
    uint32_t completed_reg_off = 0; // Q_COMPLETED_POINTER 레지스터의 byte offset 주소
    uint32_t completed_val = 0; // 위 offset 위치의 register를 읽어서 얻은 regi 값 = 마지막 완료된 descriptor index 값
    uint32_t head_reg_off = 0; // Q_HEAD_POINTER 레지스터의 byte offset 주소
    uint32_t head_val = 0; // 위 offset 위치의 register를 읽어서 얻은 값
    // guard
    if (!ctx) return -1;
    if (target_idx ==0 || target_idx >= ring_entries) return -1;
    // QCSR 주소 계산 = DMA가 완료한 마지막 descriptor 위치
    completed_reg_off = QCSR_ADDR(dir, q, Q_COMPLETED_PTR_OFF);
    head_reg_off = QCSR_ADDR(dir, q, Q_HEAD_PTR_OFF);
    while(1) {
        poll_complete_status = bwvfio_ms_read32(&ctx->dev, QCSR_REGION, head_reg_off, &head_val); // descriptor fetch stage 상태/에러 확인
        if (poll_complete_status) return poll_complete_status;
        uint32_t desc_fetch_err = ((head_val >> 24) & 0x1u); // [24] = descriptor fetch UR/timeout error (H2D/D2H 공통)
        if (desc_fetch_err) return -EIO;

        poll_complete_status = bwvfio_ms_read32(&ctx->dev, QCSR_REGION, completed_reg_off, &completed_val); //마지막 완료 descriptor ptr 주소를 읽어 completed_idx에 저장(polling)
        if (poll_complete_status) return poll_complete_status;

        // completed pointer bitfield 처리
        uint32_t completed_idx = (completed_val & 0xFFFFu);     // [15:0] = 완료 idx
        uint32_t h2d_err = ((completed_val >> 24) & 0x1u);      // [24] = H2D error bit (D2H는 reserved)
        // H2D일 때 에러비트 올라오면 즉시 실패
        if (dir == QCSR_DIR_H2D && h2d_err) return -EIO;

        if (completed_idx_out) *completed_idx_out = completed_idx; // completed_idx_out = 마지막 완료된 descriptor index 값
        if (completed_idx >= target_idx) break; // target_idx = 완료되길 기다리는 descriptor의 index
    }
    // descriptor data가 목적지에 도착 완료를 의미
     //단일 descriptor ring (ring 확장 시 로직 추가)
    atomic_thread_fence(memory_order_acquire);

    return 0;
}

// 7) 정리(free_mem + close_dev)
static inline void cleanup(dma_ctx_t *ctx){
    if (!ctx) return;
    // Host 버퍼(메모리 객체) 해제 : memid는 -1이면 미할당
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

    // 포인터/주소값 초기화
    ctx->desc_va = NULL;
    ctx->tx_va   = NULL;
    ctx->rx_va   = NULL;

    ctx->desc_iova = 0;
    ctx->tx_iova   = 0;
    ctx->rx_iova   = 0;

    // VFIO 디바이스 핸들 닫기
    bwvfio_close_dev(&ctx->dev);

    if (ctx->shared_memid >= 0) {
    (void)bwvfio_free_mem(&ctx->dev, ctx->shared_memid);
    ctx->shared_memid = -1;
    }
    ctx->shared_va = NULL;
    ctx->shared_iova = 0;
    ctx->shared_bytes = 0;
}


//main 함수

#endif // DMA_LIB_H
