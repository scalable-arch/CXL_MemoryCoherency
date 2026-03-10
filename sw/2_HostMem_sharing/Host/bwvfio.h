/*  Provided by
 *  -----------
 *      BittWare, a Molex Company.
 *      45 South Main St. Suite L100
 *      Concord, NH 03301
 *      Ph:     (603) 226 0404
 *      WWW:    https://www.bittware.com
 *      Email:  support@bittware.com
 *
 * Copyright (C) 2020, BittWare, a Molex Company.
 *
 * License:
 * This source code is provided to you (the Licensee) under
 * license by BittWare, a Molex Company. To view or use this
 * source code, the Licensee must accept a Software License
 * Agreement (viewable at developer.bittware.com), which is
 * commonly provided as a click-through license agreement. The
 * terms of the Software License Agreement govern all use and
 * distribution of this file unless an alternative superseding
 * license has been executed with BittWare. This source code
 * and its derivatives may not be distributed to third parties
 * in source code form. Software including or derived from this
 * source code, including derivative works thereof created by
 * Licensee, may be distributed to third parties with BITTWARE
 * hardware only and in executable form only.
 *
 * The click-thorough license is available here:
 * https://developer.bittware.com/software_license.txt
 *
 **/

#ifndef __BWVFIO_H_INCLUDED__
#define __BWVFIO_H_INCLUDED__

#include <linux/types.h>
#include <linux/ioctl.h>
#include <linux/vfio.h>
#include <stdint.h>
#include <stdbool.h>

#ifndef BWVFIO_VER_MAJOR
#define BWVFIO_VER_MAJOR (1)
#endif
#ifndef BWVFIO_VER_MINOR
#define BWVFIO_VER_MINOR (12)
#endif

#ifndef BWVFIO_VER_PATCH
#define BWVFIO_VER_PATCH (0)
#endif

#define BWVFIO_VERSION ((BWVFIO_VER_MAJOR << 16) | (BWVFIO_VER_MINOR << 8) | BWVFIO_VER_PATCH)
#define BWVFIO_VERSION_MAJOR(x) ((x >> 16) & 0xFF)
#define BWVFIO_VERSION_MINOR(x) ((x >> 8) & 0xFF)
#define BWVFIO_VERSION_PATCH(x) ((x) & 0xFF)

#define BWVFIO_NUM_HUGEPAGES (18)

#define BWVFIO_MEM_TYPE_BAR (0)
#define BWVFIO_MEM_TYPE_ALLOCATED (1 << 22)

#define BWVFIO_SCANOP_COUNT      (1) /* count BDFs, arg (uint32_t*) gets count */
#define BWVFIO_SCANOP_INDEX_OF   (2) /* find index of char* arg, uint32_t* arg gets index */
#define BWVFIO_SCANOP_BDF_AT     (3) /* char* arg gets bdf of device at index uint32_t* arg */

typedef struct __vfio_dmamem_attr {

#define BWVFIO_DMF_HUGE         (1 << 0)
#define BWVFIO_DMF_SHM          (1 << 4)
#define BWVFIO_DMF_WR           (1 << 9)
#define BWVFIO_DMF_RD           (1 << 10)
#define BWVFIO_DMF_RW           (BWVFIO_DMF_WR | BWVFIO_DMF_RD)
#define BWVFIO_DMF_SHMKEY       (1 << 11)   // user will specify shared memory key
#define BWVFIO_DMF_NUMA         (1 << 12)   // user will specify numa node ID
#define BWVFIO_DMF_SHM_CREATE   (1 << 13)   // create the SHM segment (requires SHM flag)
#define BWVFIO_DMF_IOVA         (1 << 14)   // user will specify iova to be used

    uint32_t flags;

    uint32_t numa;
    uint32_t shmkey;
    uint32_t shmid;
    uint64_t iova;

}BWVFIOMemAttr;

// INTERNAL structure. Not exposed via API.
typedef struct __vfio_dma_region {
    struct __vfio_dma_region *next;
    struct __vfio_dma_region *prev;

    struct __vfio_dmamem_attr attr;

    uint32_t id;

    struct vfio_iommu_type1_dma_map dma_map;
}BWVFIODMAMem;

#define BWVFIO_MAX_BDF_LEN (64)

typedef struct __vfio_pci_dev {
    struct vfio_group_status group_status;
    struct vfio_device_info device_info;
    struct vfio_region_info region_info[8];
    BWVFIODMAMem* dma_mem_head;

    char bdf[BWVFIO_MAX_BDF_LEN];  /* flawfinder: ignore */
    int device;
    int container;
    int groupfd;
    int groupid;
    bool group_open;

    __s32 msi_fds[8];
    int n_enabled_msi;
    int int_type;
} BWVFIODev;

typedef struct __vfio_group {
    struct vfio_group_status group_status;
    int containerfd;
    int groupfd;
    int groupid;
} BWVFIOGroup;

typedef struct __vfio_msi_info {
    uint32_t vector_count;
    uint64_t msi_addr;
    uint16_t msi_data;
    uint32_t flags;
    uint8_t enabled;
}BWVFIO_MSI_Info;

typedef struct __vfio_msix_info {
    uint32_t vector_count;
    uint32_t flags;
    uint32_t table_offset;
    uint8_t table_bar;
    uint32_t pba_offset;
    uint8_t pba_bar;
    uint8_t enabled;
    uint8_t all_masked;
}BWVFIO_MSIX_Info;

typedef struct __vfio_link_info {
    uint8_t link_speed;
    uint8_t link_width;
    uint8_t cap_link_speed;
    uint8_t cap_link_width;
}BWVFIO_LINK_Info;

uint32_t bwvfio_version();

int bwvfio_set_outfd(int fd);

int bwvfio_dev_count();

int bwvfio_dev_location(BWVFIODev* papd, char* location, int bufsz);

int bwvfio_dev_index(BWVFIODev* papd, uint32_t* index);

int bwvfio_dev_id(BWVFIODev* papd, uint16_t* vendor_id, uint16_t* dev_id, uint16_t* ss_vendor_id, uint16_t* ss_dev_id);

int bwvfio_open_dev_at(uint32_t index, BWVFIODev* papd);

int bwvfio_device_bdf_at(uint32_t index, char* buffer, uint32_t buflen);

int bwvfio_open_dev(const char* bdf, BWVFIODev* papd);

int bwvfio_close_dev(BWVFIODev* papd);

int bwvfio_reset_dev(BWVFIODev* papd);

int bwvfio_open_group(int groupid, BWVFIOGroup* pgrp);

int bwvfio_open_dev_from_group(BWVFIOGroup* pgrp, const char* bdf, BWVFIODev* papd);

int bwvfio_grp_from_bdf(char* pbdf, uint32_t* grpid);

int bwvfio_close_group(BWVFIOGroup* pgrp);

int bwvfio_dev_location(BWVFIODev* papd, char* buf, int buflen);

int bwvfio_ms_size(BWVFIODev* papd, uint32_t region_id, uint64_t* p64);

int bwvfio_ms_read8(BWVFIODev* papd, uint32_t region, uint32_t offset, uint8_t* p8);

int bwvfio_ms_read16(BWVFIODev* papd, uint32_t region, uint32_t offset, uint16_t* p16);

int bwvfio_ms_read32(BWVFIODev* papd, uint32_t region, uint32_t offset, uint32_t* p32);

int bwvfio_ms_read64(BWVFIODev* papd, uint32_t region, uint32_t offset, uint64_t* p64);

int bwvfio_ms_write8(BWVFIODev* papd, uint32_t region, uint32_t offset, uint8_t val8);

int bwvfio_ms_write16(BWVFIODev* papd, uint32_t region, uint32_t offset, uint16_t val16);

int bwvfio_ms_write32(BWVFIODev* papd, uint32_t region, uint32_t offset, uint32_t val32);

int bwvfio_ms_write64(BWVFIODev* papd, uint32_t region, uint32_t offset, uint64_t val64);

int bwvfio_ms_read8s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint8_t* p8, int count);

int bwvfio_ms_read16s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint16_t* p16, int count);

int bwvfio_ms_read32s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint32_t* p32, int count);

int bwvfio_ms_read64s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint64_t* p64, int count);

int bwvfio_ms_write8s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint8_t* p8, int count);

int bwvfio_ms_write16s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint16_t* p16, int count);

int bwvfio_ms_write32s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint32_t* p32, int count);

int bwvfio_ms_write64s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint64_t* p64, int count);

int bwvfio_alloc_mem(BWVFIODev* papd, uint32_t size, BWVFIOMemAttr* pAttr, uint32_t* memid);

int bwvfio_get_mem_attr(BWVFIODev* papd, BWVFIOMemAttr* pAttr, uint32_t memid);

int bwvfio_free_mem(BWVFIODev* papd, uint32_t memid);

int bwvfio_get_mem_iova(BWVFIODev* papd, uint32_t memid, uint64_t *p_iova);

int bwvfio_get_mem_va(BWVFIODev* papd, uint32_t memid, void** p_vaddr);

int bwvfio_get_mem_shmid(BWVFIODev* papd, uint32_t memid, uint32_t *p_shmid);

int bwvfio_int_enable_msi(BWVFIODev* papd, uint8_t blocking);

int bwvfio_int_disable_msi(BWVFIODev* papd);

int bwvfio_int_enable_msix(BWVFIODev* papd, uint8_t blocking);

int bwvfio_int_disable_msix(BWVFIODev* papd);

int bwvfio_int_wait_msi(BWVFIODev* papd, uint8_t channel, uint64_t* p_eventval);

int bwvfio_msi_info(BWVFIODev* papd, BWVFIO_MSI_Info* pinfo);

int bwvfio_msix_info(BWVFIODev* papd, BWVFIO_MSIX_Info* pinfo);

int bwvfio_cancel_int_wait(BWVFIODev* papd, uint32_t channel);

int bwvfio_set_bus_master(BWVFIODev* papd, int enable);

int bwvfio_find_capability(BWVFIODev* papd, uint8_t cap_id, uint8_t* offset);

int bwvfio_find_ext_capability(BWVFIODev* papd, uint16_t ext_cap_id, uint32_t* offset);

int bwvfio_link_status(BWVFIODev* papd, BWVFIO_LINK_Info* pinfo);

int bwvfio_link_errors(BWVFIODev* papd, uint16_t* link_errors, int clear_errors);



// RETURN VALUES - Not sequential due to easier translation to bw_pci error codes.
#define BWVFIO_SUCCESS       (0)
#define BWVFIO_ERROR         (1)
#define BWVFIO_NOT_FOUND     (13)
#define BWVFIO_NULL_PTR      (5)
#define BWVFIO_INVALID_ARG   (6)
#define BWVFIO_NOT_SUPPORTED (2)
#define BWVFIO_OUT_OF_MEMORY (4)
#define BWVFIO_UNAVAILABLE   (31)




#endif /* __BWVFIO_H_INCLUDED__ */