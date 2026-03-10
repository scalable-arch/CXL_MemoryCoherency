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

#include <errno.h>
#include <libgen.h>
#include <fcntl.h>
#include <libgen.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdarg.h>
#include <assert.h>
#include <dirent.h>
#include <regex.h>
#include <grp.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/param.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/vfs.h>
#include <sys/eventfd.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <inttypes.h>
#include <linux/pci.h>
#include <linux/pci_regs.h>
#include <linux/ioctl.h>
#include <numa.h>

#include "bwvfio.h"
#define SZ_4K (0x00001000UL)
#define SZ_2M (0x00200000UL)
#define SZ_1G (0x40000000UL)

#define DFL_PAGESZ SZ_1G

#define VFIO_GET_REGION_ADDR(x) ((uint64_t) x << 40ULL)

int outfd = 0;

// #define MIN(X,Y) ((X) < (Y) ? (X) : (Y))
// #define MAX(X,Y) ((X) > (Y) ? (X) : (Y))

void bwvfio_dprintf(const char* format, ...)
{
    va_list argptr;
    if(outfd)
    {
        va_start(argptr, format);
        vdprintf(outfd, format, argptr);
        va_end(argptr);
    }
}

uint32_t bwvfio_version()
{
    return BWVFIO_VERSION;
}

int bwvfio_set_outfd(int fd)
{
    outfd = fd;

    return BWVFIO_SUCCESS;
}

int _bw_owned(const char* bdf)
{
    const char* devroot = "/sys/bus/pci/devices";
    char path[PATH_MAX];  /* flawfinder: ignore */
    char link[PATH_MAX];  /* flawfinder: ignore */
    int ret;
    struct stat grpstat;
    struct group* grp;

    // readlink will *not* append null byte
    memset(link, 0, PATH_MAX);
    ret = snprintf(path, PATH_MAX, "%s/%s/iommu_group", devroot, bdf);
    ret = readlink(path, link, PATH_MAX);  /* flawfinder: ignore */
    if( ret < 0 )
        return 0;
    snprintf(path, PATH_MAX, "/dev/vfio/%s", basename(link));

    if((ret = stat(path, &grpstat)) < 0)
        return 0;
    if(!(grp = getgrgid(grpstat.st_gid)))
        return 0;

    return 0 == strcmp("bittware", grp->gr_name);
}

int _bwvfio_scan_filter(const struct dirent *entry)
{
    regex_t re;
    int reti;
    char msgbuf[100];  /* flawfinder: ignore */

    reti = regcomp(&re, "^[[:xdigit:]]{4}:[[:xdigit:]]{2}:[[:xdigit:]]{2}.[[:xdigit:]]+$", REG_EXTENDED);

    /* Execute regular expression */
    reti = regexec(&re, entry->d_name, 0, NULL, 0);
    if (!reti) {
        //printf("match --> %s\n", entry->d_name);
        //return 1;
    }
    else if (reti == REG_NOMATCH) {
        //printf("no match --> %s\n", entry->d_name);
        return 0;
    }
    else {
        regerror(reti, &re, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
    }

    /* Free memory allocated to the pattern buffer by regcomp() */
    regfree(&re);

    return _bw_owned(entry->d_name);
}

int _bwvfio_scan_bdf(int op, uint32_t* p32, char* pbuf, uint32_t buflen )
{
    const char* sysfspath = "/sys/bus/pci/drivers/vfio-pci";
    struct dirent **namelist;
    int n, ret = -BWVFIO_NOT_FOUND;

    n = scandir(sysfspath, &namelist, _bwvfio_scan_filter, alphasort);

    if (n < 0)
        return -BWVFIO_ERROR;

    if( op == BWVFIO_SCANOP_COUNT )
    {
        *p32 = n;
        ret = BWVFIO_SUCCESS;
    }

    while (n--)
    {
        // printf("%s\n", namelist[n]->d_name);
        switch(op)
        {
            case BWVFIO_SCANOP_INDEX_OF:
                if(strncmp(namelist[n]->d_name, pbuf, buflen) == 0)
                {
                    *p32 = n;
                    ret = BWVFIO_SUCCESS;
                }
                break;
            case BWVFIO_SCANOP_BDF_AT:
                if( (uint32_t)n == *p32 )
                {
                    snprintf(pbuf, buflen, "%s", namelist[n]->d_name);
                    ret = BWVFIO_SUCCESS;
                }
                break;
            case BWVFIO_SCANOP_COUNT:
                break;
            default:
                ret = -BWVFIO_INVALID_ARG;
        }
        free(namelist[n]);
    }
    free(namelist);
    return ret;
}

int bwvfio_dev_count()
{
    int ret;
    uint32_t count = 0;
    if((ret = _bwvfio_scan_bdf(BWVFIO_SCANOP_COUNT, &count, NULL, 0)) < 0)
        return ret;

    return (int)count;
}

int bwvfio_dev_index(BWVFIODev* papd, uint32_t* index)
{
    int ret;
    if(!papd || !index)
        return -BWVFIO_NULL_PTR;

    ret = _bwvfio_scan_bdf(BWVFIO_SCANOP_INDEX_OF, index, papd->bdf, BWVFIO_MAX_BDF_LEN);

    return ret;
}

int bwvfio_device_bdf_at(uint32_t index, char* buffer, uint32_t buflen)
{
    if( !buffer || (buflen < 13) )
        return -BWVFIO_INVALID_ARG;

    return _bwvfio_scan_bdf(BWVFIO_SCANOP_BDF_AT, &index, buffer, buflen);
}

int bwvfio_dev_id(BWVFIODev* papd, uint16_t* vendor_id, uint16_t* dev_id, uint16_t* ss_vendor_id, uint16_t* ss_dev_id)
{
    int ret;
    if(!papd || !vendor_id || !dev_id || !ss_vendor_id || !ss_dev_id)
        return -BWVFIO_NULL_PTR;

    if((ret = bwvfio_ms_read16(papd, VFIO_PCI_CONFIG_REGION_INDEX, 0, vendor_id)) != BWVFIO_SUCCESS)
        return ret;
    if((ret = bwvfio_ms_read16(papd, VFIO_PCI_CONFIG_REGION_INDEX, 2, dev_id)) != BWVFIO_SUCCESS)
        return ret;
    if((ret = bwvfio_ms_read16(papd, VFIO_PCI_CONFIG_REGION_INDEX, 0x2c, ss_vendor_id)) != BWVFIO_SUCCESS)
        return ret;
    if((ret = bwvfio_ms_read16(papd, VFIO_PCI_CONFIG_REGION_INDEX, 0x2e, ss_dev_id)) != BWVFIO_SUCCESS)
        return ret;

    return BWVFIO_SUCCESS;
}

int bwvfio_open_dev_at(uint32_t index, BWVFIODev* papd)
{
    int ret;
    char bdf[32];  /* flawfinder: ignore */

    if(!papd)
        return -BWVFIO_NULL_PTR;

    if((ret = bwvfio_device_bdf_at(index, bdf, sizeof(bdf))))
        return ret;

    return bwvfio_open_dev(bdf, papd);
}

int bwvfio_open_dev(const char* bdf, BWVFIODev* papd)
{
    unsigned int i;
    int ret, container, group, device, len, groupid;
    char path[PATH_MAX];  /* flawfinder: ignore */
    char iommu_group_path[PATH_MAX];  /* flawfinder: ignore */
    char *group_name;
    int seg, bus, dev, func;
    struct stat st;

    struct vfio_group_status group_status = {
        .argsz = sizeof(group_status)
    };

    struct vfio_device_info device_info = {
        .argsz = sizeof(device_info)
    };

    struct vfio_region_info region_info = {
        .argsz = sizeof(region_info)
    };

    struct vfio_iommu_type1_dma_map dma_map = {
        .argsz = sizeof(dma_map)
    };

    struct vfio_iommu_type1_dma_unmap dma_unmap = {
        .argsz = sizeof(dma_unmap)
    };

    //    struct vfio_iommu_type1_info iommu_info = {
    //        .argsz = sizeof(iommu_info)
    //    };

    ret = sscanf(bdf, "%04x:%02x:%02x.%d", &seg, &bus, &dev, &func);
    if (ret != 4) {
        bwvfio_dprintf("Error: invalid BDF format. Must include domain, bus, device, function. (mmmm:bb:dd.f)\n");
        return -BWVFIO_ERROR;
    }

    snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/iommu_group", bdf);

    ret = stat(path, &st);
    if (ret < 0) {
        bwvfio_dprintf("Device %s does not exist in sysfs tree\n", bdf);
        return -BWVFIO_ERROR;
    }

    len = readlink(path, iommu_group_path, sizeof(iommu_group_path));  /* flawfinder: ignore */
    if (len <= 0) {
        bwvfio_dprintf("No iommu_group for device\n");
        return -BWVFIO_ERROR;
    }

    iommu_group_path[len] = 0;
    group_name = basename(iommu_group_path);
    if (sscanf(group_name, "%d", &groupid) != 1) {
        bwvfio_dprintf("unknown iommu_group\n");
        return -BWVFIO_ERROR;
    }

    bwvfio_dprintf("Using PCI device %04x:%02x:%02x.%d in group %d\n",
            seg, bus, dev, func, groupid);

    container = open("/dev/vfio/vfio", O_RDWR);  /* flawfinder: ignore */
    if (container < 0) {
        printf("Failed to open /dev/vfio/vfio, %d (%s)\n",
                container, strerror(errno));
        return container;
    }

    snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
    group = open(path, O_RDWR);  /* flawfinder: ignore */
    if (group < 0) {
        bwvfio_dprintf("Failed to open %s, %d (%s)\n",
                path, group, strerror(errno));
        return group;
    }

    ret = ioctl(group, VFIO_GROUP_GET_STATUS, &group_status);
    if (ret) {
        bwvfio_dprintf("ioctl(VFIO_GROUP_GET_STATUS) failed\n");
        return ret;
    }

    if (!(group_status.flags & VFIO_GROUP_FLAGS_VIABLE)) {
        bwvfio_dprintf("Group not viable, are all devices attached to vfio?\n");
        return -BWVFIO_ERROR;
    }

    bwvfio_dprintf("pre-SET_CONTAINER:\n");
    bwvfio_dprintf("VFIO_CHECK_EXTENSION VFIO_TYPE1_IOMMU: %sPresent\n",
            ioctl(container, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ?
            "" : "Not ");
    bwvfio_dprintf("VFIO_CHECK_EXTENSION VFIO_NOIOMMU_IOMMU: %sPresent\n",
            ioctl(container, VFIO_CHECK_EXTENSION, VFIO_NOIOMMU_IOMMU) ?
            "" : "Not ");
    bwvfio_dprintf("VFIO_CHECK_EXTENSION VFIO_DMA_CC_IOMMU: %sPresent\n",
            ioctl(container, VFIO_CHECK_EXTENSION, VFIO_DMA_CC_IOMMU) ?
            "" : "Not ");


    ret = ioctl(group, VFIO_GROUP_SET_CONTAINER, &container);
    if (ret) {
        bwvfio_dprintf("Failed to set group container\n");
        return ret;
    }

    bwvfio_dprintf("post-SET_CONTAINER:\n");
    bwvfio_dprintf("VFIO_CHECK_EXTENSION VFIO_TYPE1_IOMMU: %sPresent\n",
            ioctl(container, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ?
            "" : "Not ");
    bwvfio_dprintf("VFIO_CHECK_EXTENSION VFIO_NOIOMMU_IOMMU: %sPresent\n",
            ioctl(container, VFIO_CHECK_EXTENSION, VFIO_NOIOMMU_IOMMU) ?
            "" : "Not ");

    ret = ioctl(container, VFIO_SET_IOMMU, VFIO_NOIOMMU_IOMMU);
    if (!ret) {
        bwvfio_dprintf("Incorrectly allowed no-iommu usage!\n");
        return -BWVFIO_ERROR;
    }

    ret = ioctl(container, VFIO_SET_IOMMU, VFIO_TYPE1_IOMMU);
    if (ret) {
        bwvfio_dprintf("Failed to set IOMMU\n");
        return ret;
    }

    snprintf(path, sizeof(path), "%04x:%02x:%02x.%d", seg, bus, dev, func);

    device = ioctl(group, VFIO_GROUP_GET_DEVICE_FD, path);
    if (device < 0) {
        bwvfio_dprintf("Failed to get device %s\n", path);
        return -BWVFIO_ERROR;
    }

    papd->device = device;
    papd->container = container;
    papd->groupfd = group;
    papd->groupid = groupid;
    papd->group_open = false;
    papd->dma_mem_head = NULL;

    if (ioctl(device, VFIO_DEVICE_GET_INFO, &device_info)) {
        bwvfio_dprintf("Failed to get device info\n");
        return -BWVFIO_ERROR;
    }
    memcpy(&papd->device_info, &device_info, sizeof(struct vfio_device_info));  /* flawfinder: ignore */
    memcpy(papd->bdf, bdf, sizeof(papd->bdf));  /* flawfinder: ignore */
    bwvfio_dprintf("Device supports %d regions, %d irqs\n",
            device_info.num_regions, device_info.num_irqs);

    for (i = 0; i < device_info.num_regions; i++)
    {
        bwvfio_dprintf("Region %d: ", i);
        region_info.index = i;
        if (ioctl(device, VFIO_DEVICE_GET_REGION_INFO, &region_info))
        {
            bwvfio_dprintf("Failed to get info on region %d\n", i);
            continue;
        }

        bwvfio_dprintf("size 0x%lx, offset 0x%lx, flags 0x%x\n",
                (unsigned long)region_info.size,
                (unsigned long)region_info.offset, region_info.flags);
        memcpy(&papd->region_info[i], &region_info, sizeof(struct vfio_region_info));  /* flawfinder: ignore */
    }
    bwvfio_dprintf("Success\n");

    return BWVFIO_SUCCESS;
}

int bwvfio_open_group(int groupid, BWVFIOGroup* pgrp)
{
    int ret, containerfd, groupfd;
    char path[PATH_MAX];  /* flawfinder: ignore */
    char iommu_group_path[PATH_MAX];  /* flawfinder: ignore */
    struct stat st;

    struct vfio_group_status group_status = {
        .argsz = sizeof(group_status)
    };


    snprintf(iommu_group_path, sizeof(iommu_group_path), "/sys/kernel/iommu_groups/%d", groupid);

    ret = stat(iommu_group_path, &st);
    if (ret < 0) {
        bwvfio_dprintf("No such group\n");
        return -BWVFIO_ERROR;
    }

    containerfd = open("/dev/vfio/vfio", O_RDWR);  /* flawfinder: ignore */
    if (containerfd < 0) {
        bwvfio_dprintf("Failed to open /dev/vfio/vfio, %d (%s)\n",
                containerfd, strerror(errno));
        return containerfd;
    }

    snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
    groupfd = open(path, O_RDWR);  /* flawfinder: ignore */
    if (groupfd < 0) {
        bwvfio_dprintf("Failed to open %s, %d (%s)\n",
                path, groupfd, strerror(errno));
        return groupfd;
    }

    ret = ioctl(groupfd, VFIO_GROUP_GET_STATUS, &group_status);
    if (ret) {
        bwvfio_dprintf("ioctl(VFIO_GROUP_GET_STATUS) failed\n");
        return ret;
    }

    if (!(group_status.flags & VFIO_GROUP_FLAGS_VIABLE)) {
        bwvfio_dprintf("Group not viable, are all devices attached to vfio?\n");
        return -BWVFIO_ERROR;
    }

    bwvfio_dprintf("VFIO_CHECK_EXTENSION VFIO_TYPE1_IOMMU: %sPresent\n",
            ioctl(containerfd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ?
            "" : "Not ");

    ret = ioctl(groupfd, VFIO_GROUP_SET_CONTAINER, &containerfd);
    if (ret) {
        bwvfio_dprintf("Failed to set group container\n");
        return ret;
    }

    bwvfio_dprintf("VFIO_CHECK_EXTENSION VFIO_TYPE1_IOMMU: %sPresent\n",
            ioctl(containerfd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ?
            "" : "Not ");

    ret = ioctl(containerfd, VFIO_SET_IOMMU, VFIO_TYPE1_IOMMU);
    if (ret) {
        bwvfio_dprintf("Failed to set IOMMU\n");
        return ret;
    }

    memcpy(&pgrp->group_status, &group_status, sizeof(group_status));  /* flawfinder: ignore */
    pgrp->containerfd = containerfd;
    pgrp->groupfd = groupfd;
    pgrp->groupid = groupid;

    return BWVFIO_SUCCESS;
}

int bwvfio_open_dev_from_group(BWVFIOGroup* pgrp, const char* bdf, BWVFIODev* papd)
{
    int device;
    unsigned int i;
    struct vfio_device_info device_info = {
        .argsz = sizeof(device_info)
    };

    struct vfio_region_info region_info = {
        .argsz = sizeof(region_info)
    };

    struct vfio_iommu_type1_dma_map dma_map = {
        .argsz = sizeof(dma_map)
    };

    struct vfio_iommu_type1_dma_unmap dma_unmap = {
        .argsz = sizeof(dma_unmap)
    };


    device = ioctl(pgrp->groupfd, VFIO_GROUP_GET_DEVICE_FD, bdf);
    if (device < 0) {
        bwvfio_dprintf("Failed to get device %s\n", bdf);
        return -BWVFIO_ERROR;
    }

    papd->device = device;
    papd->container = pgrp->containerfd;
    papd->groupfd = pgrp->groupfd;
    papd->groupid = pgrp->groupid;
    papd->group_open = true;
    papd->dma_mem_head = NULL;


    if (ioctl(device, VFIO_DEVICE_GET_INFO, &device_info)) {
        bwvfio_dprintf("Failed to get device info\n");
        return -BWVFIO_ERROR;
    }
    memcpy(&papd->device_info, &device_info, sizeof(struct vfio_device_info));  /* flawfinder: ignore */
    memcpy(papd->bdf, bdf, sizeof(papd->bdf));  /* flawfinder: ignore */

    bwvfio_dprintf("Device supports %d regions, %d irqs\n",
            device_info.num_regions, device_info.num_irqs);

    for (i = 0; i < device_info.num_regions; i++)
    {
        bwvfio_dprintf("Region %d: ", i);
        region_info.index = i;
        if (ioctl(device, VFIO_DEVICE_GET_REGION_INFO, &region_info))
        {
            bwvfio_dprintf("Failed to get info on region %d\n", i);
            continue;
        }

        bwvfio_dprintf("size 0x%lx, offset 0x%lx, flags 0x%x\n",
                (unsigned long)region_info.size,
                (unsigned long)region_info.offset, region_info.flags);
        memcpy(&papd->region_info[i], &region_info, sizeof(struct vfio_region_info));  /* flawfinder: ignore */
    }

    bwvfio_dprintf("Success\n");
    return BWVFIO_SUCCESS;
}

int bwvfio_grp_from_bdf(char* pbdf, uint32_t* grpid)
{
    bwvfio_dprintf("Finding IOMMU group for BDF: %s\n", pbdf);
    char path[PATH_MAX];  /* flawfinder: ignore */
    snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/iommu_group", pbdf);
    bwvfio_dprintf("sysfs path is: %s\n", path);
    char targetPath[PATH_MAX];  /* flawfinder: ignore */

    int len = readlink(path, targetPath, sizeof(targetPath) - 1);  /* flawfinder: ignore */

    if (len != -1)
    {
        targetPath[len] = '\0';
        bwvfio_dprintf("Target Path: %s\n", targetPath);
    } else {
        bwvfio_dprintf("Failed to read symlink to device IOMMU group\n");
        return -BWVFIO_NOT_FOUND;
    }

    char* grp;
    grp = strrchr(targetPath, '/');
    if (grp == NULL)
    {
        grp = targetPath;
    } else {
        grp++;
    }
    sscanf(grp, "%d", grpid);
    bwvfio_dprintf("Group ID is: %d\n", *grpid);

    return BWVFIO_SUCCESS;
}

int bwvfio_close_group(BWVFIOGroup* pgrp)
{
    close(pgrp->groupfd);
    close(pgrp->containerfd);
    return BWVFIO_SUCCESS;
}

int bwvfio_close_dev(BWVFIODev* papd)
{
    BWVFIODMAMem *pmem = NULL;

    if(!papd)
        return -BWVFIO_NULL_PTR;

    pmem = papd->dma_mem_head;

    while(pmem)
    {
        bwvfio_free_mem(papd, pmem->id);
        pmem = papd->dma_mem_head;
    }

    if (!papd->group_open)
    {
        close(papd->groupfd);
        papd->groupfd = -1;
    }
    close(papd->device);
    close(papd->container);

    papd->device = -1;
    papd->container = -1;

    return BWVFIO_SUCCESS;
}

int bwvfio_reset_dev(BWVFIODev* papd)
{
    int ret = ioctl(papd->device, VFIO_DEVICE_RESET);

    return ret;
}

int bwvfio_dev_location(BWVFIODev* papd, char* buf, int buflen)
{
    int ret = BWVFIO_SUCCESS;
    if(!papd || !buf)
    {
        bwvfio_dprintf("%s [%d]: a null pointer was supplied\n", __func__, __LINE__);
        return -BWVFIO_NULL_PTR;
    }
    // 0000:00:00.0
    // 0123456789012
    if(buflen < 12)
    {
        bwvfio_dprintf("%s [%d]: buffer length %d is insufficient to store a BDF string\n", __func__, __LINE__, buflen);
        return -BWVFIO_NULL_PTR;
    }
    if((ret = snprintf(buf, buflen, "%s", papd->bdf)) < 0)
    {
        bwvfio_dprintf("%s [%d]: error copying BDF string to target (%d)\n", __func__, __LINE__, ret);
        return -BWVFIO_ERROR;
    }
    return BWVFIO_SUCCESS;
}

int __rsv_mem_iova(BWVFIODev* papd, uint32_t size, uint64_t* p_iova, uint32_t check)
{
    BWVFIODMAMem* pmem = papd->dma_mem_head;
    uint64_t iova_start = (check ? *p_iova : 0x100000000ULL);
    uint64_t iova_end = iova_start + size - 1;
    uint64_t curr_iova_start, curr_iova_end;
    uint8_t overlaps = 0;

    while(1)
    {
        while(pmem)
        {
            curr_iova_start = pmem->dma_map.iova;
            curr_iova_end = pmem->dma_map.iova + pmem->dma_map.size - 1;

            if(MAX(iova_start,curr_iova_start) <= MIN(iova_end,curr_iova_end)) // overlaps, no good
                overlaps++;

            pmem = pmem->next;
        }
        if(overlaps == 0) // iova_start and iova_end is a good choice
        {
            *p_iova = iova_start;
            return BWVFIO_SUCCESS;
        }
        else if(check) // seeing if a desired iova is available, it wasn't.
        {
            return -BWVFIO_UNAVAILABLE;
        }
        else
        {
            if(iova_start < (uint64_t)(-SZ_4K))
            {
                iova_start += SZ_4K;
                iova_end = iova_start + size - 1;
                overlaps = 0;
                pmem = papd->dma_mem_head; // reset to beginning of mem list
            }
            else
                return -BWVFIO_OUT_OF_MEMORY;
        }
    }
    return -BWVFIO_ERROR;
}

BWVFIODMAMem* __find_mem_by_id(BWVFIODev* papd, uint32_t id)
{
    BWVFIODMAMem* pmem = papd->dma_mem_head;

    while(pmem)
    {
        if(pmem->id == id)
            break;
        pmem = pmem->next;
    }

    return pmem;
}

int __rsv_mem_id(BWVFIODev* papd, uint32_t* p_id)
{
    BWVFIODMAMem* pmem = papd->dma_mem_head;
    uint32_t next_id = BWVFIO_MEM_TYPE_ALLOCATED; // start at first valid ID

    while(1)
    {
        while(pmem)
        {
            if(pmem->id == next_id)
                break;
            pmem = pmem->next;
        }
        if(pmem) // not NULL, so found an item with proposed "next_id"
        {
            pmem = papd->dma_mem_head; // reset to beginning of mem list
            next_id++;
        }
        else // hit end of list, so next_id must be free to use.
        {
            *p_id = next_id;
            return BWVFIO_SUCCESS;
        }
    }
    return -BWVFIO_ERROR;
}

int __vmem_read(BWVFIODev* papd, uint32_t region, uint8_t width, void* pdata, uint32_t count)
{
    void* pv = NULL;
    int ret;


    if((ret = bwvfio_get_mem_va(papd, region, &pv)))
        return ret;

    memcpy(pdata, pv, count * (width / 8));  /* flawfinder: ignore */

    return BWVFIO_SUCCESS;
}

int __vmem_write(BWVFIODev* papd, uint32_t region, uint8_t width, void* pdata, uint32_t count)
{
    void* pv = NULL;
    int ret;

    if((ret = bwvfio_get_mem_va(papd, region, &pv)))
        return ret;

    memcpy(pv, pdata, count * (width / 8));  /* flawfinder: ignore */

    return BWVFIO_SUCCESS;
}

int bwvfio_ms_size(BWVFIODev* papd, uint32_t region_id, uint64_t* p64)
{
    BWVFIODMAMem *dma_mem = NULL;
    if(!papd || !p64)
        return -BWVFIO_NULL_PTR;

    switch(region_id)
    {
        case VFIO_PCI_BAR0_REGION_INDEX:
        case VFIO_PCI_BAR1_REGION_INDEX:
        case VFIO_PCI_BAR2_REGION_INDEX:
        case VFIO_PCI_BAR3_REGION_INDEX:
        case VFIO_PCI_BAR4_REGION_INDEX:
        case VFIO_PCI_BAR5_REGION_INDEX:
        case VFIO_PCI_CONFIG_REGION_INDEX:
            *p64 = papd->region_info[region_id].size;
            return BWVFIO_SUCCESS;
    }
    if(( dma_mem = __find_mem_by_id(papd, region_id)))
    {
        *p64 = dma_mem->dma_map.size;
        return BWVFIO_SUCCESS;
    }
    return -BWVFIO_NOT_SUPPORTED;
}


int bwvfio_ms_read8(BWVFIODev* papd, uint32_t region, uint32_t offset, uint8_t* p8)
{
    return bwvfio_ms_read8s(papd, region, offset, p8, 1);
}

int bwvfio_ms_read16(BWVFIODev* papd, uint32_t region, uint32_t offset, uint16_t* p16)
{
    return bwvfio_ms_read16s(papd, region, offset, p16, 1);
}

int bwvfio_ms_read32(BWVFIODev* papd, uint32_t region, uint32_t offset, uint32_t* p32)
{
    return bwvfio_ms_read32s(papd, region, offset, p32, 1);
}

int bwvfio_ms_read64(BWVFIODev* papd, uint32_t region, uint32_t offset, uint64_t* p64)
{
    return bwvfio_ms_read64s(papd, region, offset, p64, 1);
}

int bwvfio_ms_write8(BWVFIODev* papd, uint32_t region, uint32_t offset, uint8_t v8)
{
    return bwvfio_ms_write8s(papd, region, offset, &v8, 1);
}

int bwvfio_ms_write16(BWVFIODev* papd, uint32_t region, uint32_t offset, uint16_t v16)
{
    return bwvfio_ms_write16s(papd, region, offset, &v16, 1);
}

int bwvfio_ms_write32(BWVFIODev* papd, uint32_t region, uint32_t offset, uint32_t v32)
{
    return bwvfio_ms_write32s(papd, region, offset, &v32, 1);
}

int bwvfio_ms_write64(BWVFIODev* papd, uint32_t region, uint32_t offset, uint64_t v64)
{
    return bwvfio_ms_write64s(papd, region, offset, &v64, 1);
}

int bwvfio_ms_read8s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint8_t* p8, int count)
{
    if(!p8 || !papd)
        return -BWVFIO_NULL_PTR;

    switch(region)
    {
    case VFIO_PCI_BAR0_REGION_INDEX:
    case VFIO_PCI_BAR1_REGION_INDEX:
    case VFIO_PCI_BAR2_REGION_INDEX:
    case VFIO_PCI_BAR3_REGION_INDEX:
    case VFIO_PCI_BAR4_REGION_INDEX:
    case VFIO_PCI_BAR5_REGION_INDEX:
    case VFIO_PCI_CONFIG_REGION_INDEX:
        if(papd->region_info[region].size == 0)
            return -BWVFIO_INVALID_ARG;
        if(pread(papd->device, p8, count, papd->region_info[region].offset + offset) != count)
            return -BWVFIO_ERROR;
        break;
    default:
        return  __vmem_read(papd, region, 8, p8,count);
    }

    return BWVFIO_SUCCESS;
}

int bwvfio_ms_read16s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint16_t* p16, int count)
{
    if(!p16 || !papd)
        return -BWVFIO_NULL_PTR;

    switch(region)
    {
    case VFIO_PCI_BAR0_REGION_INDEX:
    case VFIO_PCI_BAR1_REGION_INDEX:
    case VFIO_PCI_BAR2_REGION_INDEX:
    case VFIO_PCI_BAR3_REGION_INDEX:
    case VFIO_PCI_BAR4_REGION_INDEX:
    case VFIO_PCI_BAR5_REGION_INDEX:
    case VFIO_PCI_CONFIG_REGION_INDEX:
        if(papd->region_info[region].size == 0)
            return -BWVFIO_INVALID_ARG;
        if(pread(papd->device, p16, count*sizeof(uint16_t), papd->region_info[region].offset + offset) != (ssize_t)(count * sizeof(uint16_t)))
            return -BWVFIO_ERROR;
        break;
    default:
        return  __vmem_read(papd, region, 16, p16, count);
    }

    return BWVFIO_SUCCESS;
}

int bwvfio_ms_read32s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint32_t* p32, int count)
{
    if(!p32 || !papd)
        return -BWVFIO_NULL_PTR;

    switch(region)
    {
    case VFIO_PCI_BAR0_REGION_INDEX:
    case VFIO_PCI_BAR1_REGION_INDEX:
    case VFIO_PCI_BAR2_REGION_INDEX:
    case VFIO_PCI_BAR3_REGION_INDEX:
    case VFIO_PCI_BAR4_REGION_INDEX:
    case VFIO_PCI_BAR5_REGION_INDEX:
    case VFIO_PCI_CONFIG_REGION_INDEX:
        if(papd->region_info[region].size == 0)
            return -BWVFIO_INVALID_ARG;
        if(pread(papd->device, p32, count * sizeof(uint32_t), papd->region_info[region].offset + offset) != (ssize_t)(count * sizeof(uint32_t)))
            return -BWVFIO_ERROR;
        break;
    default:
        return  __vmem_read(papd, region, 32, p32, count);
    }

    return BWVFIO_SUCCESS;
}

int bwvfio_ms_read64s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint64_t* p64, int count)
{
    if(!p64 || !papd)
        return -BWVFIO_NULL_PTR;

    switch(region)
    {
    case VFIO_PCI_BAR0_REGION_INDEX:
    case VFIO_PCI_BAR1_REGION_INDEX:
    case VFIO_PCI_BAR2_REGION_INDEX:
    case VFIO_PCI_BAR3_REGION_INDEX:
    case VFIO_PCI_BAR4_REGION_INDEX:
    case VFIO_PCI_BAR5_REGION_INDEX:
    case VFIO_PCI_CONFIG_REGION_INDEX:
        if(papd->region_info[region].size == 0)
            return -BWVFIO_INVALID_ARG;
        if(pread(papd->device, p64, count * sizeof(uint64_t), papd->region_info[region].offset + offset) != (ssize_t)(count * sizeof(uint64_t)))
            return -BWVFIO_ERROR;
        break;
    default:
        return  __vmem_read(papd, region, 64, p64, count);
    }

    return BWVFIO_SUCCESS;
}

int bwvfio_ms_write8s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint8_t* p8, int count)
{
    if(!papd || !p8)
        return -BWVFIO_NULL_PTR;

    switch(region)
    {
    case VFIO_PCI_BAR0_REGION_INDEX:
    case VFIO_PCI_BAR1_REGION_INDEX:
    case VFIO_PCI_BAR2_REGION_INDEX:
    case VFIO_PCI_BAR3_REGION_INDEX:
    case VFIO_PCI_BAR4_REGION_INDEX:
    case VFIO_PCI_BAR5_REGION_INDEX:
    case VFIO_PCI_CONFIG_REGION_INDEX:
        if(papd->region_info[region].size == 0)
            return -BWVFIO_INVALID_ARG;
        if(pwrite(papd->device, p8, count, papd->region_info[region].offset + offset) != count)
            return -BWVFIO_ERROR;
        break;
    default:
        return __vmem_write(papd, region, 8, p8, count);
    }

    return BWVFIO_SUCCESS;
}

int bwvfio_ms_write16s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint16_t* p16, int count)
{
    if(!papd || !p16)
        return -BWVFIO_NULL_PTR;

    switch(region)
    {
    case VFIO_PCI_BAR0_REGION_INDEX:
    case VFIO_PCI_BAR1_REGION_INDEX:
    case VFIO_PCI_BAR2_REGION_INDEX:
    case VFIO_PCI_BAR3_REGION_INDEX:
    case VFIO_PCI_BAR4_REGION_INDEX:
    case VFIO_PCI_BAR5_REGION_INDEX:
    case VFIO_PCI_CONFIG_REGION_INDEX:
        if(papd->region_info[region].size == 0)
            return -BWVFIO_INVALID_ARG;
        if(pwrite(papd->device, p16, count*sizeof(uint16_t), papd->region_info[region].offset + offset) != (ssize_t)(count * sizeof(uint16_t)))
            return -BWVFIO_ERROR;
        break;
    default:
        return __vmem_write(papd, region, 16, p16, count);
    }

    return BWVFIO_SUCCESS;
}

int bwvfio_ms_write32s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint32_t* p32, int count)
{
    if(!papd || !p32)
        return -BWVFIO_NULL_PTR;

    switch(region)
    {
    case VFIO_PCI_BAR0_REGION_INDEX:
    case VFIO_PCI_BAR1_REGION_INDEX:
    case VFIO_PCI_BAR2_REGION_INDEX:
    case VFIO_PCI_BAR3_REGION_INDEX:
    case VFIO_PCI_BAR4_REGION_INDEX:
    case VFIO_PCI_BAR5_REGION_INDEX:
    case VFIO_PCI_CONFIG_REGION_INDEX:
        if(papd->region_info[region].size == 0)
            return -BWVFIO_INVALID_ARG;
        if(pwrite(papd->device, p32, count * sizeof(uint32_t), papd->region_info[region].offset + offset) != (ssize_t)(count * sizeof(uint32_t)))
            return -BWVFIO_ERROR;
        break;
    default:
        return __vmem_write(papd, region, 32, p32, count);
    }

    return BWVFIO_SUCCESS;
}

int bwvfio_ms_write64s(BWVFIODev* papd, uint32_t region, uint32_t offset, uint64_t* p64, int count)
{
    if(!papd || !p64)
        return -BWVFIO_NULL_PTR;

    switch(region)
    {
    case VFIO_PCI_BAR0_REGION_INDEX:
    case VFIO_PCI_BAR1_REGION_INDEX:
    case VFIO_PCI_BAR2_REGION_INDEX:
    case VFIO_PCI_BAR3_REGION_INDEX:
    case VFIO_PCI_BAR4_REGION_INDEX:
    case VFIO_PCI_BAR5_REGION_INDEX:
    case VFIO_PCI_CONFIG_REGION_INDEX:
        if(papd->region_info[region].size == 0)
            return -BWVFIO_INVALID_ARG;
        if(pwrite(papd->device, p64, count * sizeof(uint64_t), papd->region_info[region].offset + offset) != (ssize_t)(count * sizeof(uint64_t)))
            return -BWVFIO_ERROR;
        break;
    default:
        return __vmem_write(papd, region, 64, p64, count);
    }

    return BWVFIO_SUCCESS;
}

int bwvfio_alloc_mem(BWVFIODev* papd, uint32_t size, BWVFIOMemAttr* pAttr, uint32_t *memid)
{
    BWVFIODMAMem *dma_mem = NULL;
    void* ppage = NULL;
    int ret;
    uint64_t new_iova = pAttr->iova;
    dma_mem = (BWVFIODMAMem*)calloc(1, sizeof(BWVFIODMAMem));

    if(!dma_mem)
        return BWVFIO_OUT_OF_MEMORY;
    dma_mem->dma_map.argsz = sizeof(struct vfio_iommu_type1_dma_map);

    if(pAttr->flags & BWVFIO_DMF_RD)
        dma_mem->dma_map.flags |= VFIO_DMA_MAP_FLAG_READ;
    if(pAttr->flags & BWVFIO_DMF_WR)
        dma_mem->dma_map.flags |= VFIO_DMA_MAP_FLAG_WRITE;

    // Q : do we care if the size is evenly divisible by phys page size?
    // ie; size += (size % DFL_PAGESZ);
    memcpy(&dma_mem->attr, pAttr, sizeof(BWVFIOMemAttr));  /* flawfinder: ignore */
    dma_mem->dma_map.size = size;

    if((ret = __rsv_mem_iova(papd, size, &new_iova, ((pAttr->flags & BWVFIO_DMF_IOVA) ? 1 : 0))) < 0)
    {
        bwvfio_dprintf("unable to reserve an iova for allocated memory\n");
        free(dma_mem);
        return ret;
    }
    //printf("reserve_iova: ret = %d, iova = %" PRIx64 "\n", ret, new_iova);
    dma_mem->dma_map.iova = new_iova;

    if((ret = __rsv_mem_id(papd, &dma_mem->id)) < 0)
    {
        bwvfio_dprintf("unable to reserve a unique id for allocated memory\n");
        free(dma_mem);
        return -BWVFIO_ERROR;
    }

    // If SHM then do the shmget/shmat, etc method.
    // Otherwise, default is mmap method.
    // But *either* method can be hugepage backed. Thus the HUGE flag.

    if(pAttr->flags & BWVFIO_DMF_SHM)
    {
        int shmflg = 0, shmid = 0;
        if(pAttr->flags & BWVFIO_DMF_SHM_CREATE)
            shmflg |= IPC_CREAT;
        if(pAttr->flags & BWVFIO_DMF_RD)
            shmflg |= SHM_R;
        if(pAttr->flags & BWVFIO_DMF_WR)
            shmflg |= SHM_W;
        if(pAttr->flags & BWVFIO_DMF_HUGE)
            shmflg |= SHM_HUGETLB;

        if((pAttr->flags & BWVFIO_DMF_SHMKEY) == 0) // not caller specified
            dma_mem->attr.shmkey = (1000*papd->groupid)+10+(dma_mem->id & 0x0000FFFF);

        shmid = shmget(dma_mem->attr.shmkey, size, shmflg);
        //if((ret = shmget((1000*papd->groupid)+10+page, DFL_PAGESZ, SHM_HUGETLB | IPC_CREAT | SHM_R | SHM_W)) < 0)
        if(shmid < 0)
        {
            bwvfio_dprintf("failed to get shared memory with shmkey=%d\n", dma_mem->attr.shmkey);
            free(dma_mem);
            return -BWVFIO_ERROR;
        }
        dma_mem->attr.shmid = shmid;
        ppage = (void*)shmat(dma_mem->attr.shmid, (void*)0, 0);

        if(ppage == (void*)-1)
        {
            bwvfio_dprintf("shmat failed\n");
            free(dma_mem);
            return -BWVFIO_ERROR;
        }

        //move buffer to specific numa node. Need to check the error from this also still.
        if(pAttr->flags & BWVFIO_DMF_NUMA)
            numa_tonode_memory(ppage, size, dma_mem->attr.numa);

        dma_mem->dma_map.vaddr = (unsigned long)ppage;

        ret = ioctl(papd->container, VFIO_IOMMU_MAP_DMA, &dma_mem->dma_map);
        if(ret)
        {
            bwvfio_dprintf("ioctl to map  huge page failed (%d)\n", ret);
            if((ret = shmdt((const void*)dma_mem->dma_map.vaddr)) != 0)
                bwvfio_dprintf("Failed to detach from shared dma buffer (%d)\n", ret);

            shmctl(dma_mem->attr.shmid, IPC_RMID, NULL);
            free(dma_mem);

            return ret;
        }
    }
    else // mmap method
    {
        int mmflags = MAP_SHARED | MAP_ANONYMOUS;
        if(pAttr->flags & BWVFIO_DMF_HUGE)
            mmflags |= MAP_HUGETLB;
        ppage = mmap(NULL, size, PROT_READ | PROT_WRITE, mmflags, -1, 0);
        if(ppage == MAP_FAILED)
        {
            bwvfio_dprintf("map memory failed\n");
            free(dma_mem);
            return -BWVFIO_ERROR;
        }
        //move buffer to specific numa node. Need to check the error from this also still.
        if(pAttr->flags & BWVFIO_DMF_NUMA)
            numa_tonode_memory(ppage, size, dma_mem->attr.numa);

        dma_mem->dma_map.vaddr = (unsigned long)ppage;
        if((ret = ioctl(papd->container, VFIO_IOMMU_MAP_DMA, &(dma_mem->dma_map))))
        {
            bwvfio_dprintf("ioctl to map  huge page failed (%d)\n", ret);
            free(dma_mem);
            return -BWVFIO_ERROR;
        }
    }

    // insert it into the dev's allocated memory list
    if(papd->dma_mem_head) // elements already exist...
    {
        dma_mem->next = papd->dma_mem_head;
        papd->dma_mem_head->prev = dma_mem;
    }
    papd->dma_mem_head = dma_mem; // new head

    *memid = dma_mem->id;

    return BWVFIO_SUCCESS;
}

int bwvfio_get_mem_attr(BWVFIODev* papd, BWVFIOMemAttr* pAttr, uint32_t memid)
{
    BWVFIODMAMem* pmem = NULL;

    if(!papd || !pAttr)
        return -BWVFIO_NULL_PTR;

    if((pmem = __find_mem_by_id(papd, memid)))
    {
        memcpy(pAttr, &pmem->attr, sizeof(BWVFIOMemAttr));  /* flawfinder: ignore */
        return BWVFIO_SUCCESS;
    }

    return -BWVFIO_NOT_FOUND;
}

int bwvfio_free_mem(BWVFIODev* papd, uint32_t memid)
{
    BWVFIODMAMem* pmem = NULL;
    BWVFIODMAMem* temp = NULL;
    int ret, found = 0;
    struct vfio_iommu_type1_dma_unmap dma_unmap = {
        .argsz = sizeof(dma_unmap)
    };

    if(!papd)
    {
        bwvfio_dprintf("invalid device handle\n");
        return -BWVFIO_NULL_PTR;
    }

    pmem = papd->dma_mem_head;

    while(pmem && (found == 0))
    {
        if(pmem->id == memid)
        {
            temp = pmem;
            if(temp == papd->dma_mem_head)
                papd->dma_mem_head = temp->next;

            if(temp->prev)
                temp->prev->next = temp->next;
            if(temp->next)
                temp->next->prev = temp->prev;
            found = 1;
        }
        pmem = pmem->next;
    }

    if(found)
    {
        dma_unmap.iova = temp->dma_map.iova;
        dma_unmap.size = temp->dma_map.size;

        bwvfio_dprintf("bwvfio_free_mem: freeing mem id=%d (iova=%" PRIx64 ")\n", temp->id, temp->dma_map.iova);

        ret = ioctl(papd->container, VFIO_IOMMU_UNMAP_DMA, &dma_unmap);
        if(ret)
            bwvfio_dprintf("unmap: ioctl to unmap memory failed. (%d) (iova=%" PRIx64 ")\n", ret, temp->dma_map.iova);

        if(temp->attr.flags & BWVFIO_DMF_SHM)
        {
            bwvfio_dprintf(" - was shared memory, detaching\n");
            shmdt((const void*)temp->dma_map.vaddr);
            if(temp->attr.flags & BWVFIO_DMF_SHM_CREATE) // only remove the ID if we created it
            {
                bwvfio_dprintf(" - was created by this process, freeing ID\n");
                shmctl(temp->attr.shmid, IPC_RMID, NULL);
            }
        }
        free(temp);
        return 0;
    }

    return -BWVFIO_NOT_FOUND;
}

int bwvfio_get_mem_iova(BWVFIODev* papd, uint32_t memid, uint64_t *p_iova)
{
    BWVFIODMAMem* pmem = NULL;

    if(!papd)
        return -BWVFIO_NULL_PTR;

    if((pmem = __find_mem_by_id(papd, memid)))
    {
        *p_iova = pmem->dma_map.iova;
        return BWVFIO_SUCCESS;
    }

    return -BWVFIO_NOT_FOUND;
}

int bwvfio_get_mem_va(BWVFIODev* papd, uint32_t memid, void** p_vaddr)
{
    BWVFIODMAMem* pmem = NULL;

    if(!papd)
        return -BWVFIO_NULL_PTR;

    if((pmem = __find_mem_by_id(papd, memid)))
    {
        *p_vaddr = (void*)pmem->dma_map.vaddr;
        return BWVFIO_SUCCESS;
    }

    return -BWVFIO_NOT_FOUND;
}

int bwvfio_get_mem_shmid(BWVFIODev* papd, uint32_t memid, uint32_t *p_shmid)
{
    BWVFIODMAMem* pmem = NULL;

    if(!papd)
        return -BWVFIO_NULL_PTR;

    if((pmem = __find_mem_by_id(papd, memid)))
    {
        *p_shmid = pmem->attr.shmid;
        return BWVFIO_SUCCESS;
    }

    return -BWVFIO_NOT_FOUND;
}

int bwvfio_find_capability(BWVFIODev* papd, uint8_t cap_id, uint8_t* offset)
{
    int ret;
    uint32_t nextcap=0, val32;

    if(!papd)
        return -BWVFIO_NULL_PTR;

    if((ret = bwvfio_ms_read32(papd, VFIO_PCI_CONFIG_REGION_INDEX, PCI_CAPABILITY_LIST, &nextcap)))
        return ret;

    while(nextcap != 0)
    {
        if((ret = bwvfio_ms_read32(papd, VFIO_PCI_CONFIG_REGION_INDEX, nextcap, &val32)))
            return ret;
        //printf("val32 = %#x\n", val32);
        //printf("  id is %#x\n", (val32 & 0x00ff));
        //printf("  nx is %#x\n", ((val32 >> 8) & 0x00ff));
        if((val32 & 0x000000FF) == cap_id)
        {
            *offset = nextcap;
            return BWVFIO_SUCCESS;
        }
        nextcap = ((val32 >> 8) & 0x000000ff);
    }
    return -BWVFIO_NOT_FOUND;
}

int bwvfio_find_ext_capability(BWVFIODev* papd, uint16_t ext_cap_id, uint32_t* offset)
{
    int ret;
    uint32_t nextcap=0, val32;

    if(!papd)
        return -BWVFIO_NULL_PTR;

    nextcap = 0x100;
    while(nextcap != 0)
    {
        if((ret = bwvfio_ms_read32(papd, VFIO_PCI_CONFIG_REGION_INDEX, nextcap, &val32)))
            return ret;
        //printf("  id is %#x\n", PCI_EXT_CAP_ID(val32));
        //printf("  ver is %#x\n", PCI_EXT_CAP_VER(val32));
        //printf("  next is %#x\n\n", PCI_EXT_CAP_NEXT(val32));
        if(PCI_EXT_CAP_ID(val32) == ext_cap_id)
        {
            *offset = nextcap;
            return BWVFIO_SUCCESS;
        }
        nextcap = PCI_EXT_CAP_NEXT(val32);
    }
    return -BWVFIO_NOT_FOUND;
}

int bwvfio_int_enable_msi(BWVFIODev* papd, uint8_t blocking)
{
    unsigned int i;
    int ret;
    uint32_t count = 0;
    struct vfio_irq_info irq_info = { .argsz = sizeof(struct vfio_irq_info) };
    struct vfio_irq_set* irq_set;

    if(!papd)
    {
        bwvfio_dprintf("bwvfio: invalid handle\n");
        return -BWVFIO_NULL_PTR;
    }
    if(papd->n_enabled_msi)
    {
        bwvfio_dprintf("bwvfio: interrupts already enabled.\n");
        return -BWVFIO_ERROR;
    }

    irq_info.index = VFIO_PCI_MSI_IRQ_INDEX;
    if (ioctl(papd->device, VFIO_DEVICE_GET_IRQ_INFO, &irq_info))
    {
        bwvfio_dprintf("Failed to get MSI interrupts info\n");
        return -BWVFIO_NOT_SUPPORTED;
    }

    bwvfio_dprintf("bwvfio: msi info flags  %#08x\n", irq_info.flags);
    bwvfio_dprintf("bwvfio: msi index (MSI) %#08x\n", irq_info.index);
    bwvfio_dprintf("bwvfio: msi count       %#08x\n", irq_info.count);

    count = irq_info.count;

    irq_set = (struct vfio_irq_set*)calloc(sizeof(struct vfio_irq_set) + (sizeof(__s32)*count), 1);

    for(i = 0; i < count; i++)
    {
        if(blocking)
            papd->msi_fds[i] = eventfd(0, 0);   // BLOCKING
        else
            papd->msi_fds[i] = eventfd(0, EFD_NONBLOCK);  // NON-BLOCKING
    }

    irq_set->flags = VFIO_IRQ_SET_DATA_EVENTFD|VFIO_IRQ_SET_ACTION_TRIGGER;
    irq_set->argsz = sizeof(struct vfio_irq_set) + (sizeof(__s32)*count);
    irq_set->count=count;
    irq_set->start=0;
    irq_set->index = VFIO_PCI_MSI_IRQ_INDEX;

    memcpy(irq_set->data, papd->msi_fds, count * sizeof(__s32));  /* flawfinder: ignore */
    if((ret = ioctl(papd->device, VFIO_DEVICE_SET_IRQS, irq_set)))
    {
        bwvfio_dprintf("Failed to set MSI interrupts [stage 1] (%d)\n", ret);
        free(irq_set);
        return -BWVFIO_ERROR;
    }
    papd->n_enabled_msi = count;
    papd->int_type = VFIO_PCI_MSI_IRQ_INDEX;
    free(irq_set);

    return BWVFIO_SUCCESS;
}

int bwvfio_int_wait_msi(BWVFIODev* papd, uint8_t channel, uint64_t* p_eventval)
{
    uint64_t eventval = 0;
    int n;
    if(!papd)
    {
        bwvfio_dprintf("bwvfio: invalid handle\n");
        return -BWVFIO_NULL_PTR;
    }
    if(channel >= papd->n_enabled_msi)
    {
        bwvfio_dprintf("bwvfio: channel out of range\n");
        return -BWVFIO_INVALID_ARG;
    }
    if(papd->msi_fds[channel] == 0) // should never happen
    {
        bwvfio_dprintf("bwvfio: invalid file descriptor\n");
        return -BWVFIO_INVALID_ARG;
    }
    n = read(papd->msi_fds[channel], &eventval, sizeof(uint64_t));  /* flawfinder: ignore */
    //printf("bwvfio.wfi : reading channel %d : ret=%d val=%" PRIu64 "\n", channel, n, eventval);

    // if the requested 8 bytes of data have been read (an interrupt event has occurred)
    if(n == 8)
        *p_eventval = eventval;

    return (n == 8 ? 1 : n);
}

int bwvfio_int_disable_msi(BWVFIODev* papd)
{
    int ret, i;
    struct vfio_irq_set* irq_set;

    if(!papd)
    {
        bwvfio_dprintf("bwvfio: invalid handle\n");
        return -BWVFIO_NULL_PTR;
    }

    irq_set = (struct vfio_irq_set*)calloc(sizeof(struct vfio_irq_set), 1);
    irq_set->flags = VFIO_IRQ_SET_DATA_NONE|VFIO_IRQ_SET_ACTION_TRIGGER;
    irq_set->argsz = sizeof(struct vfio_irq_set);
    irq_set->count=0; // disables all of them.. ?
    irq_set->start=0;
    irq_set->index = VFIO_PCI_MSI_IRQ_INDEX;
    if ((ret = ioctl(papd->device, VFIO_DEVICE_SET_IRQS, irq_set)))
    {
        bwvfio_dprintf("Failed to unset MSI interrupts (%d)\n", ret);
        return -BWVFIO_ERROR;
    }

    free(irq_set);
    for(i = 0; i < papd->n_enabled_msi; i++)
    {
        if(papd->msi_fds[i])
        {
            close(papd->msi_fds[i]);
            papd->msi_fds[i] = 0;
        }
    }
    papd->n_enabled_msi = 0;
    papd->int_type = -1;

    return BWVFIO_SUCCESS;
}

int bwvfio_int_enable_msix(BWVFIODev* papd, uint8_t blocking)
{
    unsigned int i;
    int ret;
    uint32_t count;
    struct vfio_irq_info irq_info = { .argsz = sizeof(struct vfio_irq_info) };
    struct vfio_irq_set* irq_set;

    if(!papd)
    {
        bwvfio_dprintf("bwvfio: invalid handle\n");
        return -BWVFIO_NULL_PTR;
    }
    if(papd->n_enabled_msi)
    {
        bwvfio_dprintf("bwvfio: interrupts already enabled.\n");
        return -BWVFIO_ERROR;
    }

    irq_info.index = VFIO_PCI_MSIX_IRQ_INDEX;
    if (ioctl(papd->device, VFIO_DEVICE_GET_IRQ_INFO, &irq_info))
    {
        bwvfio_dprintf("Failed to get MSIX interrupts info\n");
        return -BWVFIO_NOT_SUPPORTED;
    }

    bwvfio_dprintf("bwvfio: msix info flags  %#08x\n", irq_info.flags);
    bwvfio_dprintf("bwvfio: msix index (MSI) %#08x\n", irq_info.index);
    bwvfio_dprintf("bwvfio: msix count       %#08x\n", irq_info.count);

    count = irq_info.count;

    irq_set = (struct vfio_irq_set*)calloc(sizeof(struct vfio_irq_set) + (sizeof(__s32)*count), 1);

    for(i = 0; i < count; i++)
    {
        if(blocking)
            papd->msi_fds[i] = eventfd(0, 0);   // BLOCKING
        else
            papd->msi_fds[i] = eventfd(0, EFD_NONBLOCK);  // NON-BLOCKING
    }

    irq_set->flags = VFIO_IRQ_SET_DATA_EVENTFD|VFIO_IRQ_SET_ACTION_TRIGGER;
    irq_set->argsz = sizeof(struct vfio_irq_set) + (sizeof(__s32)*count);
    irq_set->count=count;
    irq_set->start=0;
    irq_set->index = VFIO_PCI_MSIX_IRQ_INDEX;

    memcpy(irq_set->data, papd->msi_fds, count * sizeof(__s32));  /* flawfinder: ignore */
    if((ret = ioctl(papd->device, VFIO_DEVICE_SET_IRQS, irq_set)))
    {
        bwvfio_dprintf("Failed to set MSIX interrupts [stage 1] (%d)\n", ret);
        free(irq_set);
        return -BWVFIO_ERROR;
    }
    papd->n_enabled_msi = count;
    papd->int_type = VFIO_PCI_MSIX_IRQ_INDEX;
    free(irq_set);

    return BWVFIO_SUCCESS;
}

int bwvfio_int_disable_msix(BWVFIODev* papd)
{
    int ret, i;
    struct vfio_irq_set* irq_set;

    if(!papd)
    {
        bwvfio_dprintf("bwvfio: invalid handle\n");
        return -BWVFIO_NULL_PTR;
    }

    irq_set = (struct vfio_irq_set*)calloc(sizeof(struct vfio_irq_set), 1);
    irq_set->flags = VFIO_IRQ_SET_DATA_NONE|VFIO_IRQ_SET_ACTION_TRIGGER;
    irq_set->argsz = sizeof(struct vfio_irq_set);
    irq_set->count=0; // disables all of them.. ?
    irq_set->start=0;
    irq_set->index = VFIO_PCI_MSIX_IRQ_INDEX;
    if ((ret = ioctl(papd->device, VFIO_DEVICE_SET_IRQS, irq_set)))
    {
        bwvfio_dprintf("Failed to unset MSI interrupts (%d)\n", ret);
        return -BWVFIO_NOT_SUPPORTED;
    }

    free(irq_set);
    for(i = 0; i < papd->n_enabled_msi; i++)
    {
        if(papd->msi_fds[i])
        {
            close(papd->msi_fds[i]);
            papd->msi_fds[i] = 0;
        }
    }
    papd->n_enabled_msi = 0;
    papd->int_type = -1;

    return BWVFIO_SUCCESS;
}

int bwvfio_cancel_int_wait(BWVFIODev* papd, uint32_t channel)
{
    int ret;
    struct vfio_irq_set* irq_set;

    if(!papd)
    {
        bwvfio_dprintf("bwvfio: invalid handle\n");
        return -BWVFIO_NULL_PTR;
    }
    if((papd->n_enabled_msi == 0) || (papd->int_type == -1))
    {
        bwvfio_dprintf("bwvfio: cannot cancel interrupt wait, not enabled.\n");
        return -BWVFIO_ERROR;
    }

    irq_set = (struct vfio_irq_set*)calloc(sizeof(struct vfio_irq_set), 1);
    irq_set->flags = VFIO_IRQ_SET_DATA_NONE|VFIO_IRQ_SET_ACTION_TRIGGER;
    irq_set->argsz = sizeof(struct vfio_irq_set);
    irq_set->count=1;
    irq_set->start=channel;
    irq_set->index = papd->int_type;

    if ((ret = ioctl(papd->device, VFIO_DEVICE_SET_IRQS, irq_set)))
    {
        bwvfio_dprintf("Failed to cancel MSI interrupt on channel %d (%d)\n", channel, ret);
        return -BWVFIO_NOT_SUPPORTED;
    }

    return BWVFIO_SUCCESS;
}

int bwvfio_set_bus_master(BWVFIODev* papd, int enable)
{
    uint16_t reg;
    int ret;

    ret = pread(papd->device, &reg, sizeof(reg),
            VFIO_GET_REGION_ADDR(VFIO_PCI_CONFIG_REGION_INDEX) +
            PCI_COMMAND);
    if (ret != sizeof(reg)) {
        bwvfio_dprintf("Cannot read command from PCI config space!\n");
        return -BWVFIO_ERROR;
    }

    if (enable)
        /* set the master bit */
        reg |= PCI_COMMAND_MASTER;
    else
        reg &= ~(PCI_COMMAND_MASTER);

    ret = pwrite(papd->device, &reg, sizeof(reg),
            VFIO_GET_REGION_ADDR(VFIO_PCI_CONFIG_REGION_INDEX) +
            PCI_COMMAND);

    if (ret != sizeof(reg)) {
        bwvfio_dprintf("Cannot write command to PCI config space!\n");
        return -BWVFIO_ERROR;
    }

    return BWVFIO_SUCCESS;
}

int bwvfio_msi_info(BWVFIODev* papd, BWVFIO_MSI_Info* pinfo)
{
    int ret, cfgfd;
    uint8_t msi_cap_offs;
    uint16_t msi_data;
    uint32_t val32;
    uint32_t addrhi = 0, addrlo = 0;
    struct vfio_irq_info irq_info = { .argsz = sizeof(struct vfio_irq_info) };
    char sysfspath[1024];  /* flawfinder: ignore */

    if(!papd)
        return -BWVFIO_NULL_PTR;
    if(!pinfo)
        return -BWVFIO_NULL_PTR;

    if((ret = bwvfio_find_capability(papd, PCI_CAP_ID_MSI, &msi_cap_offs)))
        return -BWVFIO_NOT_FOUND;

    if((ret = bwvfio_ms_read32(papd, VFIO_PCI_CONFIG_REGION_INDEX, msi_cap_offs, &val32)))
        return -BWVFIO_ERROR;

    snprintf(sysfspath, sizeof(sysfspath), "/sys/bus/pci/devices/%s/config", papd->bdf);
    if((cfgfd = open(sysfspath, O_RDONLY)) < 0)  /* flawfinder: ignore */
    {
        return -BWVFIO_NOT_FOUND;
    }
    if(pread(cfgfd, &addrlo, 4, msi_cap_offs + 4) != 4)
    {
        close(cfgfd);
        return -BWVFIO_ERROR;
    }

    if(val32 & (1 << 23)) // is the MSI_ADDRESS a 64 bit addr?
    {
        if(pread(cfgfd, &addrhi, 4, msi_cap_offs + 8) != 4)
        {
            close(cfgfd);
            return -BWVFIO_ERROR;
        }
        if(pread(cfgfd, &msi_data, 2, msi_cap_offs + 12) != 2)
        {
            close(cfgfd);
            return -BWVFIO_ERROR;
        }
    }
    else // 32 bit address
    {
        if(pread(cfgfd, &msi_data, 2, msi_cap_offs + 8) != 2)
        {
            close(cfgfd);
            return -BWVFIO_ERROR;
        }
    }
    close(cfgfd);

    irq_info.index = VFIO_PCI_MSI_IRQ_INDEX;

    if(ioctl(papd->device, VFIO_DEVICE_GET_IRQ_INFO, &irq_info))
        return -BWVFIO_ERROR;

    pinfo->flags = irq_info.flags;
    pinfo->vector_count = irq_info.count;
    pinfo->msi_addr = ((uint64_t)addrhi << 32) | addrlo;
    pinfo->msi_data = msi_data;
    pinfo->enabled = ((val32 & (1<<16)) ? 1 : 0);

    return BWVFIO_SUCCESS;
}

int bwvfio_msix_info(BWVFIODev* papd, BWVFIO_MSIX_Info* pinfo)
{
    int ret;
    uint32_t msix_cap_regs[3];
    uint8_t msix_cap_offs;
    struct vfio_irq_info irq_info = { .argsz = sizeof(struct vfio_irq_info) };

    if(!papd)
    {
        bwvfio_dprintf("bwvfio: invalid handle\n");
        return -BWVFIO_NULL_PTR;
    }
    if(papd->n_enabled_msi)
    {
        bwvfio_dprintf("bwvfio: interrupts already enabled.\n");
        return -BWVFIO_ERROR;
    }
    if((ret = bwvfio_find_capability(papd, PCI_CAP_ID_MSIX, &msix_cap_offs)))
    {
        bwvfio_dprintf("bwvfio: device does not support MSI-X\n");
        return -BWVFIO_NOT_SUPPORTED;
    }
    irq_info.index = VFIO_PCI_MSIX_IRQ_INDEX;
    if (ioctl(papd->device, VFIO_DEVICE_GET_IRQ_INFO, &irq_info))
    {
        bwvfio_dprintf("Failed to get MSI interrupts info\n");
        return -BWVFIO_NOT_SUPPORTED;
    }
    if((ret = bwvfio_ms_read32s(papd, VFIO_PCI_CONFIG_REGION_INDEX, msix_cap_offs, msix_cap_regs, 3)))
    {
        bwvfio_dprintf("bwvfio: could not read MSI-X capability registers\n");
        return -BWVFIO_ERROR;
    }

    pinfo->flags = irq_info.flags;
    pinfo->vector_count = irq_info.count;
    pinfo->enabled = ((msix_cap_regs[0] & (1<<31)) ? 1 : 0);
    pinfo->table_offset = msix_cap_regs[1] & ~0x7;
    pinfo->table_bar = msix_cap_regs[1] & 0x7;
    pinfo->pba_offset = msix_cap_regs[2] & ~0x7;
    pinfo->pba_bar = msix_cap_regs[2] & 0x7;
    pinfo->all_masked = msix_cap_regs[0] & (1 << 30);

    return BWVFIO_SUCCESS;
}

int bwvfio_link_status(BWVFIODev* papd, BWVFIO_LINK_Info* pinfo)
{
    int ret;
    uint8_t caps_offs;
    uint32_t  link_cap_reg;
    uint16_t link_status_reg;
    if ((ret = bwvfio_find_capability(papd, PCI_CAP_ID_EXP, &caps_offs)))
    {
        bwvfio_dprintf("bwvfio: could not find PCI Express capability\n");
        return -BWVFIO_NOT_SUPPORTED;
    }
    if((ret = bwvfio_ms_read32(papd, VFIO_PCI_CONFIG_REGION_INDEX, caps_offs + PCI_EXP_LNKCAP, &link_cap_reg)))
    {
        bwvfio_dprintf("bwvfio: could not read link capability registers\n");
        return -BWVFIO_ERROR;
    }
    if((ret = bwvfio_ms_read16(papd, VFIO_PCI_CONFIG_REGION_INDEX, caps_offs + PCI_EXP_LNKSTA, &link_status_reg)))
    {
        bwvfio_dprintf("bwvfio: could not read link status registers\n");
        return -BWVFIO_ERROR;
    }

    const uint8_t link_speed = link_status_reg & 0xF;
    const uint8_t link_width = (link_status_reg & 0x3F0) >> 4;

    const uint8_t cap_link_speed = link_cap_reg & 0xF;
    const uint8_t cap_link_width = (link_cap_reg & 0x3F0) >> 4;

    pinfo->link_speed = link_speed;
    pinfo->link_width = link_width;
    pinfo->cap_link_speed = cap_link_speed;
    pinfo->cap_link_width = cap_link_width;

    return BWVFIO_SUCCESS;
}

int bwvfio_link_errors(BWVFIODev* papd, uint16_t* link_errors, int clear_errors)
{
    int ret;
    uint8_t caps_offs;
    if ((ret = bwvfio_find_capability(papd, PCI_CAP_ID_EXP, &caps_offs)))
    {
        bwvfio_dprintf("bwvfio: could not find PCI Express capability\n");
        return -BWVFIO_NOT_SUPPORTED;
    }
    if((ret = bwvfio_ms_read16(papd, VFIO_PCI_CONFIG_REGION_INDEX, caps_offs + PCI_EXP_DEVSTA, link_errors)))
    {
        bwvfio_dprintf("bwvfio: could not read device status registers\n");
        return -BWVFIO_ERROR;
    }

    if (clear_errors)
    {
        const uint16_t data16 = 0xFFFF;
        if ((ret = bwvfio_ms_write16(papd, VFIO_PCI_CONFIG_REGION_INDEX, caps_offs + PCI_EXP_DEVSTA, data16)))
        {
            bwvfio_dprintf("bwvfio: could not clear error registers");
            return -BWVFIO_ERROR;
        }
    }

    return BWVFIO_SUCCESS;
}