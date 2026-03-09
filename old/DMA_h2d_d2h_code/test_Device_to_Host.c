#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <inttypes.h>
#include <stdatomic.h>
#include <errno.h>
#include <stdlib.h>

#include "dma.lib.h"

// ---------------------- 유틸 ----------------------
static inline uint64_t parse_u64(const char *s, int *ok)
{
    if (!s) { if (ok) *ok = 0; return 0; }
    errno = 0;
    char *end = NULL;
    unsigned long long v = strtoull(s, &end, 0);
    if (errno != 0 || end == s || (end && *end != '\0')) {
        if (ok) *ok = 0;
        return 0;
    }
    if (ok) *ok = 1;
    return (uint64_t)v;
}

static int parse_offset_or_va(void *base, size_t size, const char *tok, size_t *off_out)
{
    int ok = 0;
    uint64_t v = parse_u64(tok, &ok);
    if (!ok) return -1;

    uint64_t base_u = (uint64_t)(uintptr_t)base;
    uint64_t end_u  = base_u + (uint64_t)size;

    // absolute VA
    if (v >= base_u && v < end_u) {
        *off_out = (size_t)(v - base_u);
        return 0;
    }
    // offset
    if (v < (uint64_t)size) {
        *off_out = (size_t)v;
        return 0;
    }
    return -1;
}

// ---------------------- DMA (H2D) 함수 ----------------------
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

// ---------------------- "강제 IOVA" alloc ----------------------
static int alloc_mem_force_iova(BWVFIODev *dev,
                                size_t bytes,
                                uint64_t iova_base,
                                int *memid_out,
                                void **va_out,
                                uint64_t *iova_out)
{
    if (!dev || !memid_out || !va_out || !iova_out) return -1;

    const size_t PAGE = 4096;
    size_t map_sz = align_up_sz(bytes, PAGE);

    BWVFIOMemAttr attr = (BWVFIOMemAttr){0};
    attr.flags = BWVFIO_DMF_SHM | BWVFIO_DMF_SHM_CREATE | BWVFIO_DMF_RW | BWVFIO_DMF_IOVA;
    attr.iova  = iova_base;

    int memid = -1;
    int st = bwvfio_alloc_mem(dev, map_sz, &attr, &memid);
    if (st) return st;

    void *va = NULL;
    st = bwvfio_get_mem_va(dev, memid, &va);
    if (st) {
        (void)bwvfio_free_mem(dev, memid);
        return st;
    }

    uint64_t iova = 0;
    st = bwvfio_get_mem_iova(dev, memid, &iova);
    if (st) {
        (void)bwvfio_free_mem(dev, memid);
        return st;
    }

    *memid_out = memid;
    *va_out    = va;
    *iova_out  = iova;
    return 0;
}

static int alloc_dma_buffers_at_iova(dma_ctx_t *ctx,
                                    size_t desc_ring_bytes,
                                    size_t tx_bytes,
                                    size_t rx_bytes,
                                    uint64_t dma_iova_base)
{
    if (!ctx) return -1;
    const size_t PAGE = 4096;

    ctx->desc_memid = -1;
    ctx->tx_memid   = -1;
    ctx->rx_memid   = -1;
    ctx->desc_va = NULL;
    ctx->tx_va   = NULL;
    ctx->rx_va   = NULL;
    ctx->desc_iova = 0;
    ctx->tx_iova   = 0;
    ctx->rx_iova   = 0;

    uint64_t next = dma_iova_base;

    size_t desc_sz = align_up_sz(desc_ring_bytes, PAGE);
    int st = bwvfio_alloc_mem(&ctx->dev, desc_sz,
                             &(BWVFIOMemAttr){
                                 .flags = BWVFIO_DMF_SHM | BWVFIO_DMF_SHM_CREATE | BWVFIO_DMF_RW | BWVFIO_DMF_IOVA,
                                 .iova  = next
                             },
                             &ctx->desc_memid);
    if (st) goto fail;
    next += desc_sz;

    st = bwvfio_get_mem_va(&ctx->dev, ctx->desc_memid, &ctx->desc_va);
    if (st) goto fail;
    st = bwvfio_get_mem_iova(&ctx->dev, ctx->desc_memid, &ctx->desc_iova);
    if (st) goto fail;

    if (tx_bytes) {
        size_t tx_sz = align_up_sz(tx_bytes, PAGE);
        st = bwvfio_alloc_mem(&ctx->dev, tx_sz,
                              &(BWVFIOMemAttr){
                                  .flags = BWVFIO_DMF_SHM | BWVFIO_DMF_SHM_CREATE | BWVFIO_DMF_RW | BWVFIO_DMF_IOVA,
                                  .iova  = next
                              },
                              &ctx->tx_memid);
        if (st) goto fail;
        next += tx_sz;

        void *tmp = NULL;
        st = bwvfio_get_mem_va(&ctx->dev, ctx->tx_memid, &tmp);
        if (st) goto fail;
        ctx->tx_va = (uint8_t *)tmp;

        st = bwvfio_get_mem_iova(&ctx->dev, ctx->tx_memid, &ctx->tx_iova);
        if (st) goto fail;
    }

    if (rx_bytes) {
        size_t rx_sz = align_up_sz(rx_bytes, PAGE);
        st = bwvfio_alloc_mem(&ctx->dev, rx_sz,
                              &(BWVFIOMemAttr){
                                  .flags = BWVFIO_DMF_SHM | BWVFIO_DMF_SHM_CREATE | BWVFIO_DMF_RW | BWVFIO_DMF_IOVA,
                                  .iova  = next
                              },
                              &ctx->rx_memid);
        if (st) goto fail;
        next += rx_sz;

        void *tmp = NULL;
        st = bwvfio_get_mem_va(&ctx->dev, ctx->rx_memid, &tmp);
        if (st) goto fail;
        ctx->rx_va = (uint8_t *)tmp;

        st = bwvfio_get_mem_iova(&ctx->dev, ctx->rx_memid, &ctx->rx_iova);
        if (st) goto fail;
    }

    {
        uint32_t ring_entries = (1u << RING_ORDER_LOG2);
        if (ring_entries >= 2) {
            uint32_t invalid_idx = 2;
            mcdma_desc_t *slot = (mcdma_desc_t *)((uint8_t *)ctx->desc_va +
                                (uint64_t)(invalid_idx - 1) * DESC_BYTES);
            memset(slot, 0, sizeof(*slot));
            desc_set_u64(slot, 0x18, (1ull << 62));
        }
    }

    return 0;

fail:
    if (ctx->rx_memid >= 0) { (void)bwvfio_free_mem(&ctx->dev, ctx->rx_memid); ctx->rx_memid = -1; }
    if (ctx->tx_memid >= 0) { (void)bwvfio_free_mem(&ctx->dev, ctx->tx_memid); ctx->tx_memid = -1; }
    if (ctx->desc_memid >= 0){ (void)bwvfio_free_mem(&ctx->dev, ctx->desc_memid); ctx->desc_memid = -1; }
    ctx->desc_va = NULL; ctx->tx_va = NULL; ctx->rx_va = NULL;
    ctx->desc_iova = 0; ctx->tx_iova = 0; ctx->rx_iova = 0;
    return st;
}

// ---------------------- interactive loop ----------------------
static void interactive_loop(uint8_t *shared_va, size_t shared_sz)
{
    char line[256];

    printf("\n[interactive] shared_va=%p size=0x%zx\n", (void*)shared_va, shared_sz);
    printf("  read [offset_or_va]\n");
    printf("  write <value>\n");
    printf("  write <offset_or_va> <value>\n");
    printf("  exit\n");

    while (1) {
        printf("cmd> ");
        fflush(stdout);

        if (!fgets(line, sizeof(line), stdin)) break;

        char *save = NULL;
        char *cmd  = strtok_r(line, " \t\r\n", &save);
        if (!cmd) continue;

        if (!strcmp(cmd, "exit")) {
            break;
        } else if (!strcmp(cmd, "read")) {
            char *a1 = strtok_r(NULL, " \t\r\n", &save);

            size_t off = 0;
            if (a1) {
                if (parse_offset_or_va(shared_va, shared_sz, a1, &off) != 0) {
                    printf("ERR: bad offset/va: %s\n", a1);
                    continue;
                }
            }

            if (off + sizeof(uint64_t) > shared_sz) {
                printf("ERR: out of range (off=0x%zx)\n", off);
                continue;
            }

            uint64_t v = 0;
            memcpy(&v, shared_va + off, sizeof(v));
            printf("read [off=0x%zx] = 0x%016" PRIx64 "\n", off, v);

        } else if (!strcmp(cmd, "write")) {
            char *a1 = strtok_r(NULL, " \t\r\n", &save);
            char *a2 = strtok_r(NULL, " \t\r\n", &save);

            if (!a1) {
                printf("ERR: write <value>  OR  write <offset_or_va> <value>\n");
                continue;
            }

            size_t off = 0;
            uint64_t val = 0;
            int ok = 0;

            if (!a2) {
                // write <value>  -> offset=0
                val = parse_u64(a1, &ok);
                if (!ok) { printf("ERR: bad value: %s\n", a1); continue; }
            } else {
                // write <offset_or_va> <value>
                if (parse_offset_or_va(shared_va, shared_sz, a1, &off) != 0) {
                    printf("ERR: bad offset/va: %s\n", a1);
                    continue;
                }
                val = parse_u64(a2, &ok);
                if (!ok) { printf("ERR: bad value: %s\n", a2); continue; }
            }

            if (off + sizeof(uint64_t) > shared_sz) {
                printf("ERR: out of range (off=0x%zx)\n", off);
                continue;
            }

            memcpy(shared_va + off, &val, sizeof(val));
            atomic_thread_fence(memory_order_release);
            printf("write [off=0x%zx] <= 0x%016" PRIx64 "\n", off, val);

        } else {
            printf("ERR: unknown cmd: %s\n", cmd);
        }
    }
}

// ---------------------- main ----------------------
int main(int argc, char **argv)
{
    const char *bdf = (argc >= 2) ? argv[1] : "0000:41:00.0";

    int ok = 1;
    uint64_t shared_bytes     = (argc >= 3) ? parse_u64(argv[2], &ok) : (128ULL << 20);
    if (!ok || shared_bytes == 0) return 1;

    uint64_t shared_iova_base = (argc >= 4) ? parse_u64(argv[3], &ok) : 0x01000000ULL;
    if (!ok) return 1;

    uint64_t mailbox_dev_addr = (argc >= 5) ? parse_u64(argv[4], &ok) : 0x0ULL;
    if (!ok) return 1;

    const size_t PAGE = 4096;

    dma_ctx_t ctx = (dma_ctx_t){0};
    ctx.desc_memid = ctx.tx_memid = ctx.rx_memid = -1;

    int st = init_vfio(&ctx, bdf);
    if (st) {
        printf("init_vfio failed: %d\n", st);
        return 1;
    }

    int shared_memid = -1;
    void *shared_va = NULL;
    uint64_t shared_iova = 0;

    size_t shared_map_sz = align_up_sz((size_t)shared_bytes, PAGE);

    st = alloc_mem_force_iova(&ctx.dev, shared_map_sz, shared_iova_base,
                              &shared_memid, &shared_va, &shared_iova);
    if (st) {
        printf("alloc shared failed: %d\n", st);
        cleanup(&ctx);
        return 1;
    }

    memset(shared_va, 0x00, (shared_map_sz >= 4096 ? 4096 : shared_map_sz));

    uint64_t dma_iova_base = shared_iova + (uint64_t)shared_map_sz;

    st = alloc_dma_buffers_at_iova(&ctx, 4096, 4096, 4096, dma_iova_base);
    if (st) {
        printf("alloc DMA buffers failed: %d\n", st);
        (void)bwvfio_free_mem(&ctx.dev, shared_memid);
        cleanup(&ctx);
        return 1;
    }

    printf("=== SHARED ===\n");
    printf("shared_bytes   = %" PRIu64 " (aligned=%zu)\n", shared_bytes, shared_map_sz);
    printf("shared_iova    = 0x%016" PRIx64 "\n", shared_iova);
    printf("shared_va      = %p\n", shared_va);

    printf("=== DMA ===\n");
    printf("IOVA(desc) = 0x%016" PRIx64 "\n", ctx.desc_iova);
    printf("IOVA(tx)   = 0x%016" PRIx64 "\n", ctx.tx_iova);
    printf("IOVA(rx)   = 0x%016" PRIx64 "\n", ctx.rx_iova);

    uint64_t payload = shared_iova;
    printf("Writing shared_iova(0x%016" PRIx64 ") to device memory @0x%016" PRIx64 " via H2D DMA...\n",
           payload, mailbox_dev_addr);

    st = h2d_write_buf(&ctx, mailbox_dev_addr, &payload, (uint32_t)sizeof(payload));
    if (st) {
        printf("H2D write failed: %d\n", st);
        (void)bwvfio_free_mem(&ctx.dev, shared_memid);
        cleanup(&ctx);
        return 1;
    }
    printf("H2D write done.\n");

    // 여기부터 유저 입력 대기
    interactive_loop((uint8_t*)shared_va, shared_map_sz);

    (void)bwvfio_free_mem(&ctx.dev, shared_memid);
    cleanup(&ctx);
    return 0;
}