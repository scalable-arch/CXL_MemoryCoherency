// bam.lib.h
// Minimal helper layer for BAR2 (BAM/PIO) read/write tests using bwvfio
//
// NOTE:
// - This is intentionally separate from dma.lib.h (which is oriented around MCDMA descriptor + DMA flows).
// - For MCDMA Avalon-MM PIO Master, Intel/Altera documentation states:
//   * BAR2 is mapped to the PIO Master
//   * accesses must be 8-byte aligned
//   * only non-bursting 64-bit reads/writes are supported
//   So this helper intentionally uses 64-bit (qword) MMIO only.

#ifndef BAM_LIB_H
#define BAM_LIB_H

#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <errno.h>
#include <stdatomic.h>

#include <linux/vfio.h>   // VFIO_PCI_BAR2_REGION_INDEX

#include "bwvfio.h"      // BWVFIODev, bwvfio_* APIs

#ifdef __cplusplus
extern "C" {
#endif

#ifndef BAM_DEFAULT_REGION
#define BAM_DEFAULT_REGION VFIO_PCI_BAR2_REGION_INDEX
#endif

typedef struct {
    BWVFIODev dev;
} bam_ctx_t;

static inline const char* bam_region_name(uint32_t region)
{
    switch (region) {
        case VFIO_PCI_BAR0_REGION_INDEX: return "BAR0";
        case VFIO_PCI_BAR1_REGION_INDEX: return "BAR1";
        case VFIO_PCI_BAR2_REGION_INDEX: return "BAR2";
        case VFIO_PCI_BAR3_REGION_INDEX: return "BAR3";
        case VFIO_PCI_BAR4_REGION_INDEX: return "BAR4";
        case VFIO_PCI_BAR5_REGION_INDEX: return "BAR5";
        default: return "REGION";
    }
}

static inline int bam_init(bam_ctx_t* ctx, const char* bdf)
{
    if (!ctx || !bdf) return -EINVAL;
    memset(ctx, 0, sizeof(*ctx));

    int rc = bwvfio_open_dev(bdf, &ctx->dev);
    if (rc) return rc;

    // NOTE: Bus Master is only required for DMA (device-initiated PCIe). For pure MMIO it isn't required,
    // but enabling it is typically harmless and keeps behavior consistent with your DMA test apps.
    rc = bwvfio_set_bus_master(&ctx->dev, 1);
    if (rc) {
        bwvfio_close_dev(&ctx->dev);
        return rc;
    }

    return 0;
}

static inline void bam_cleanup(bam_ctx_t* ctx)
{
    if (!ctx) return;
    bwvfio_close_dev(&ctx->dev);
}

static inline int bam_get_bar_size(bam_ctx_t* ctx, uint32_t region, uint64_t* size_out)
{
    if (!ctx || !size_out) return -EINVAL;
    return bwvfio_ms_size(&ctx->dev, region, size_out);
}

// 64-bit MMIO write to BAR
static inline int bam_bar_write64(bam_ctx_t* ctx, uint32_t region, uint32_t offset, uint64_t value)
{
    if (!ctx) return -EINVAL;

    // Alignment check: qword-aligned
    if (offset & 0x7u) return -EINVAL;

    // Compiler barrier before MMIO write (ordering between normal stores and this MMIO write)
    atomic_thread_fence(memory_order_release);

    return bwvfio_ms_write64(&ctx->dev, region, offset, value);
}

// 64-bit MMIO read from BAR
static inline int bam_bar_read64(bam_ctx_t* ctx, uint32_t region, uint32_t offset, uint64_t* value_out)
{
    if (!ctx || !value_out) return -EINVAL;
    if (offset & 0x7u) return -EINVAL;

    int rc = bwvfio_ms_read64(&ctx->dev, region, offset, value_out);

    // Compiler barrier after MMIO read (ordering for code that consumes the read result)
    atomic_thread_fence(memory_order_acquire);

    return rc;
}

#ifdef __cplusplus
}
#endif

#endif // BAM_LIB_H
