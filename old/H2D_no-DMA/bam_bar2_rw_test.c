// bam_bar2_rw_test.c
// Host-side BAR2 (BAM/PIO) R/W sanity test using bwvfio.
//
// Usage:
//   sudo ./bam_bar2_rw_test <BDF> [offset_hex]
// Example:
//   sudo ./bam_bar2_rw_test 0000:01:00.0
//   sudo ./bam_bar2_rw_test 0000:01:00.0 0x0
//
// Notes:
// - This test uses 64-bit aligned MMIO reads/writes (qword).
// - For MCDMA Avalon-MM PIO Master, 32-bit transactions are not supported; use 64-bit.

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <errno.h>

#include "bam.lib.h"

static void usage(const char* prog)
{
    fprintf(stderr,
            "Usage: %s <BDF> [offset_hex]\n"
            "  BDF example: 0000:01:00.0\n"
            "  offset_hex  : BAR offset (must be 8-byte aligned), default 0x0\n",
            prog);
}

static uint32_t parse_u32_hex(const char* s)
{
    // Accept 0x... or decimal
    errno = 0;
    char* endp = NULL;
    unsigned long v = strtoul(s, &endp, 0);
    if (errno || !endp || *endp != '\0' || v > 0xFFFFFFFFul) {
        fprintf(stderr, "Invalid number: '%s'\n", s);
        exit(2);
    }
    return (uint32_t)v;
}

int main(int argc, char** argv)
{
    if (argc < 2) {
        usage(argv[0]);
        return 2;
    }

    const char* bdf = argv[1];
    uint32_t offset = 0x0u;
    if (argc >= 3) offset = parse_u32_hex(argv[2]);

    if (offset & 0x7u) {
        fprintf(stderr, "ERROR: offset 0x%08x is not 8-byte aligned\n", offset);
        return 2;
    }

    bam_ctx_t ctx;
    int rc = bam_init(&ctx, bdf);
    if (rc) {
        fprintf(stderr, "bwvfio_open_dev/init failed (rc=%d) for %s\n", rc, bdf);
        return 1;
    }

    uint64_t bar_sz = 0;
    rc = bam_get_bar_size(&ctx, BAM_DEFAULT_REGION, &bar_sz);
    if (rc == 0) {
        printf("Opened %s, %s size = 0x%" PRIx64 " bytes\n", bdf, bam_region_name(BAM_DEFAULT_REGION), bar_sz);
        if (bar_sz && (uint64_t)offset + 8 > bar_sz) {
            fprintf(stderr, "WARNING: offset 0x%08x is outside BAR2 size 0x%" PRIx64 "\n", offset, bar_sz);
        }
    } else {
        fprintf(stderr, "WARNING: cannot query BAR2 size (rc=%d). Continuing...\n", rc);
    }

    uint64_t before = 0;
    rc = bam_bar_read64(&ctx, BAM_DEFAULT_REGION, offset, &before);
    if (rc) {
        fprintf(stderr, "BAR2 read64 failed at offset 0x%08x (rc=%d)\n", offset, rc);
        bam_cleanup(&ctx);
        return 1;
    }
    printf("[0] Read  @ BAR2+0x%08x = 0x%016" PRIx64 "\n", offset, before);

    // Test patterns
    const uint64_t patterns[] = {
        0x0123456789ABCDEFULL,
        0xFEDCBA9876543210ULL,
        0xA5A5A5A55A5A5A5AULL,
        0x0000000000000000ULL,
        0xFFFFFFFFFFFFFFFFULL,
    };

    int failures = 0;
    for (size_t i = 0; i < sizeof(patterns)/sizeof(patterns[0]); i++) {
        uint64_t w = patterns[i];
        uint64_t r = 0;

        rc = bam_bar_write64(&ctx, BAM_DEFAULT_REGION, offset, w);
        if (rc) {
            fprintf(stderr, "BAR2 write64 failed (rc=%d) pattern[%zu]=0x%016" PRIx64 "\n", rc, i, w);
            failures++;
            continue;
        }

        // Read-after-write forces ordering/completion for posted writes on PCIe
        rc = bam_bar_read64(&ctx, BAM_DEFAULT_REGION, offset, &r);
        if (rc) {
            fprintf(stderr, "BAR2 read64 failed after write (rc=%d)\n", rc);
            failures++;
            continue;
        }

        printf("[%zu] Write 0x%016" PRIx64 " -> Read 0x%016" PRIx64 " %s\n",
               i + 1, w, r, (r == w) ? "OK" : "MISMATCH");

        if (r != w) failures++;
    }

    bam_cleanup(&ctx);

    if (failures) {
        fprintf(stderr, "\nRESULT: FAIL (%d mismatches/errors)\n", failures);
        fprintf(stderr, "Hints:\n"
                        " - Verify BAR2 is actually mapped to BAM/your HBM window (not a different interface).\n"
                        " - Confirm the target behind BAM returns readable data (HBM path connected, no error slave).\n"
                        " - Ensure 64-bit, 8-byte aligned accesses are supported by your configuration.\n");
        return 1;
    }

    printf("\nRESULT: PASS\n");
    return 0;
}
