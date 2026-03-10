// dma.lib.h

#ifndef DMA_LIB_H
#define DMA_LIB_H

/* Common DMA/VFIO helper header */

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

/* BAR / region selection */
#define QCSR_REGION   VFIO_PCI_BAR0_REGION_INDEX

/* QCSR address mapping */
#define QCSR_BASE          0x000000u
#define QCSR_DIR_D2H       0u
#define QCSR_DIR_H2D       1u
#define QCSR_ADDR(dir,q,off) (QCSR_BASE + ((uint32_t)(dir) << 19) + ((uint32_t)(q) << 8) + (uint32_t)(off))

/* QCSR register offsets */
#define Q_CTRL_OFF            0x00u
#define Q_START_ADDR_L_OFF    0x08u
#define Q_START_ADDR_H_OFF    0x0Cu
#define Q_SIZE_OFF            0x10u
#define Q_TAIL_PTR_OFF        0x14u
#define Q_HEAD_PTR_OFF        0x18u
#define Q_COMPLETED_PTR_OFF   0x1Cu
#define Q_RESET_OFF           0x48u

/* Q_CTRL bits */
#define Q_CTRL_QEN            (1u << 0)

/* Queue / descriptor parameters */
#define QUEUE_ID              0u
#define RING_ORDER_LOG2       1u
#define DESC_IDX_FIRST        1u

#define DESC_BYTES            32u
#define DMA_LEN_MAX_BYTES     (1u << 20)
#define DMA_PYLD_CNT_MASK     ((1u << 20) - 1u)

/* Temporary device memory address */
#define DEV_DDR_BASE_TMP      0xDEAD0000ull
#define DEV_ADDR_TMP          (DEV_DDR_BASE_TMP + 0x1000ull)

/* DMA context: device handle, DMA buffers, shared buffer, and IOVA information */
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

/* 32-byte MCDMA descriptor container */
typedef struct {
    uint8_t b[32];
} mcdma_desc_t;

/* Raw field writers for descriptor words */
static inline void desc_set_u64(mcdma_desc_t *d, size_t off, uint64_t v){
    memcpy(&d->b[off], &v, sizeof(v));
}

static inline void desc_set_u32(mcdma_desc_t *d, size_t off, uint32_t v){
    memcpy(&d->b[off], &v, sizeof(v));
}

/* Encode payload count according to the DMA specification */
static inline uint32_t encode_pyld_cnt(uint32_t len_bytes){
    if (len_bytes == DMA_LEN_MAX_BYTES) return 0;
    return len_bytes;
}

/* Ensure descriptor writes become visible before the doorbell write */
static inline void doorbell_write_barrier(void) {
    atomic_thread_fence(memory_order_release);
}

/* Open the VFIO device and enable bus mastering */
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

/* Align a size value upward */
static inline size_t align_up_sz(size_t x, size_t a) {
    return (x + (a - 1)) & ~(a - 1);
}

/* Allocate a shared window with a fixed IOVA */
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

/* Allocate descriptor, TX, and RX DMA buffers with fixed IOVA placement */
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

/* Initialize a DMA queue by resetting it, programming the ring base, size, and enable bit */
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

/* Write one H2D descriptor into the descriptor ring */
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

/* Write one D2H descriptor into the descriptor ring */
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

/* Ring the queue doorbell by updating the tail pointer */
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

/* Poll completion and optionally return the completed descriptor index */
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

/* Release DMA/shared buffers and close the VFIO device */
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