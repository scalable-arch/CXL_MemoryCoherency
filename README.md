# CXL Memory Coherency Validation Suite

This repository contains host-side and device-side test programs for validating basic CXL functionality on the FPGA platform, including:

* **CXL.io MMIO access**
* **CXL.mem device-memory read/write**
* **Host-memory sharing between Host and Device**
* **Device-memory sharing between Host and Device**

The software is organized to support both Linux host execution and bare-metal debugging on the HPS through RiscFree.

---

## 1. Repository Overview

The main software tree is located under `sw/` and is organized as follows:

```text
sw/
├── 1-1_CXL_io/
├── 1-2_CXL_mem/
├── 1-3_CXL_cache/
├── 2_HostMem_sharing/
├── 3_DeviceMem_sharing/
├── fpga_image.rbf
└── run_riscfree.sh
```

### Directory Description

| Directory / File | Description |
| :--- | :--- |
| `1-1_CXL_io/` | **CXL.io validation:** Checks whether the host can access FPGA BAR space through PCIe/CXL.io and confirm read/write behavior. |
| `1-2_CXL_mem/` | **CXL.mem validation:** Checks whether the host can read and write a portion of device memory through the DMA-based path. |
| `2_HostMem_sharing/` | **Host-memory sharing test:** Host starts first, initializes the shared memory region, and the device starts later to issue requests. |
| `3_DeviceMem_sharing/` | **Device-memory sharing test:** Device starts first, then the host starts later and participates in the synchronized increment test. |
| `run_riscfree.sh` | Launches the RiscFree workspace for the provided HPS projects. |
| `fpga_image.rbf` | FPGA bitstream used by the initialization scripts. |

---

## 2. Prerequisites

Before running the tests, make sure the following environment is available:

* Linux host system with access to the FPGA card
* **BittWare utilities installed:** `bw_bmc_configure`, `bw_bmc_fpga_load`
* **PCIe utilities installed:** `lspci`
* `sudo` permission
* `gcc` & `libnuma`
* **RiscFree** installed and callable as `RiscFree`
* JTAG/debug connection for HPS bring-up through RiscFree

---

## 3. General Notes

### FPGA Initialization
Each test directory contains a `run_init.sh` script. This script reboots the BMC, loads the FPGA bitstream, rescans PCIe, checks the link/enumeration, and waits for HPS boot. It prints `Initiation Done!` on success.

> [!IMPORTANT]
> When prompted during BMC reboot, enter: `y`
> If `OK` does not appear, retry the initialization script.

### RiscFree
Open RiscFree only when needed:
```bash
cd sw
./run_riscfree.sh
```

### Final Counter
> [!NOTE]
> For both memory-sharing tests, the final result is the `Final counter` value printed in the host terminal.

---

## 4. CXL.io Test
This test verifies that the host can access the FPGA MMIO space through the BAR/QCSR path.

**Steps:**
```bash
cd sw
./run_riscfree.sh          # only when opening RiscFree is needed
cd 1-1_CXL_io
./run_init.sh              # Enter 'y' once when asked
```
After `Initiation Done!` appears, run:
```bash
./run_cxl_io_test.sh
```
**Expected Result:** The program prints a sequence of MMIO read/write checks and reports whether the written value matches the readback value.

---

## 5. CXL.mem Test
This test verifies that the host can access a portion of device memory through the DMA path.

**Steps:**
```bash
cd sw
./run_riscfree.sh          # only when opening RiscFree is needed
cd 1-2_CXL_mem
./run_init.sh              # Enter 'y' once when asked
```
After `Initiation Done!` appears, run:
```bash
./run_cxl_mem_test.sh
```
**Expected Result:** The program performs multiple device-memory write/readback checks and prints pass/fail messages for each address.

---

## 6. Device Memory Sharing Test

> [!TIP]
> **Test Flow:** 1. **Device first** -> 2. **Host second**

1. **Move to the software directory:** `cd sw`
2. **Launch RiscFree** (if needed): `./run_riscfree.sh`
3. **Initialize the FPGA and host environment:**
   ```bash
   cd 3_DeviceMem_sharing
   ./run_init.sh
   ```
4. **Build the device-side project in RiscFree:**
   * Right-click `DeviceMem_sharing` -> **Clean Project** -> **Build Project** (Use **Refresh** first if the view is stale).
5. **Start device execution in RiscFree:**
   * Right-click `260306_test` -> **Debug As** -> **1 Ashling ...**
6. **Run to the synchronization end point:**
   * In `main.c`, find `end = 1;` -> Right-click -> **Run to Line**
7. **Run the host-side program:**
   ```bash
   ./run_host.sh
   # Or with optional increment count:
   ./run_host.sh -n 5000
   ```
8. **Check the final result:** Look for the `Final counter` value in the terminal.

---

## 7. Host Memory Sharing Test

> [!TIP]
> **Test Flow:** 1. **Host first** -> 2. **Device second**

1. **Move to the software directory:** `cd sw`
2. **Launch RiscFree** (if needed): `./run_riscfree.sh`
3. **Initialize the FPGA and host environment:**
   ```bash
   cd 2_HostMem_sharing
   ./run_init.sh
   ```
4. **Run the host-side program first:**
   ```bash
   ./run_host.sh
   # Or with optional increment count:
   ./run_host.sh -n 5000
   ```
5. **Build the device-side project in RiscFree:**
   * Right-click `HostMem_sharing` -> **Clean Project** -> **Build Project**
6. **Start device execution in RiscFree:**
   * Right-click `HostMem_sharing` -> **Debug As** -> **1 Ashling ...**
7. **Run to the synchronization end point:**
   * In `main.c`, find `end = 1;` -> Right-click -> **Run to Line**
8. **Check the final result:** Look for the `Final counter` value in the terminal.

---

## 8. Notes on Increment Count

For the memory-sharing tests, the host script supports `-n [increment_count]` to change the number of host-side increment operations.

```bash
./run_host.sh -n 1000
```
> [!NOTE]
> To compare host and device contributions symmetrically, match the host increment count with the device-side increment constant in the device source.

---

## 9. Expected Output Summary

* **CXL.io:** BAR/QCSR read/write test messages, PASS/WARN/FAIL readback logs.
* **CXL.mem:** Device-memory DMA read/write test messages, PASS/WARN/FAIL readback logs.
* **Memory Sharing:** Handshake progress, Increment execution, and `Final counter = ...`

---

## 10. Troubleshooting

| Issue | Solution |
| :--- | :--- |
| **`OK` does not appear in `run_init.sh`** | Retry the script. Ensure the card is enumerated properly. Check BMC reboot and FPGA load status. |
| **`invalid target...` in RiscFree** | Use the existing working target/debug configuration. Recheck JTAG connection and target selection. |
| **Build changes do not appear** | Click **Refresh** -> **Clean Project** -> **Build Project**. |
| **Host script does not run** | Check `sudo` permission. Verify `libnuma` is installed. Ensure PCIe device is enumerated in `lspci`. |

---

## 11. Main Output to Record

For validation and reporting, ensure you record the following primary evidence that communication paths are functioning correctly:

1. `CXL.io` read/write result
2. `CXL.mem` read/write result
3. `Final counter` value for host-memory sharing
4. `Final counter` value for device-memory sharing