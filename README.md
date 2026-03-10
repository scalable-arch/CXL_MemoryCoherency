# CXL Memory Coherency Validation Suite

This repository contains host-side and device-side test programs for validating basic CXL functionality on the FPGA platform, including:

* **CXL.io MMIO access**
* **CXL.mem device-memory read/write**
* **Host-memory sharing between Host and Device** (CXL.cache support verified)
* **Device-memory sharing between Host and Device** (CXL.cache support verified)



The software is organized to support both Linux host execution and bare-metal debugging on the HPS through RiscFree.

---

## 1. Repository & Source Code Overview

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

### 1.1 Common Libraries & Utilities
Files used across multiple tests for setup, configuration, and fundamental operations.

* **`run_riscfree.sh`** : Launches the RiscFree workspace for the provided HPS projects.
* **`fpga_image.rbf`** : FPGA bitstream used by the initialization scripts.
* **`sw/*/Host/bwvfio.h` & `bwvfio.c`** : Low-level VFIO header and implementation for PCIe BAR MMIO access and DMA memory allocation/mapping.
* **`sw/*/Host/dma.lib.h`** : Common DMA helper library for descriptor setup, queue initialization, doorbell, completion polling, and cleanup.

### 1.2 Validation Directories
* **`1-1_CXL_io/`** : CXL.io validation. Checks whether the host can access FPGA BAR space through PCIe/CXL.io and confirm read/write behavior.
  * *Source:* `sw/1-1_CXL_io/src/cxl_io_test.c`
* **`1-2_CXL_mem/`** : CXL.mem validation. Checks whether the host can read and write a portion of device memory through the DMA-based path.
  * *Source:* `sw/1-2_CXL_mem/src/cxl_mem_test.c`
* **`2_HostMem_sharing/`** : Host-memory sharing test. The host starts first and initializes the shared memory region. The device starts later to issue requests.
  * *Host Source:* `sw/2_HostMem_sharing/Host/main.c`
  * *Device Source:* `riscfree/Riscfree_260306/HostMem_sharing/src/main.c`
* **`3_DeviceMem_sharing/`** : Device-memory sharing test. The device starts first. The host starts later and participates in the synchronized increment test.
  * *Host Source:* `sw/3_DeviceMem_sharing/Host/main.c`
  * *Device Source:* `riscfree/Riscfree_260306/DeviceMem_sharing/src/main.c`

---

## 2. General Notes

### 2.1 FPGA Initialization
Each test directory contains a `run_init.sh` script. This script performs the following:
1. Reboots the BMC
2. Loads the FPGA bitstream
3. Rescans PCIe
4. Checks the PCIe link and device enumeration
5. Waits for HPS boot
6. Prints `Initiation Done!` on success

> **Note:** When prompted during BMC reboot, enter `y`. If `OK` does not appear, retry the initialization script.

### 2.2 RiscFree
Open RiscFree only when needed by running:
```bash
cd sw
./run_riscfree.sh
```

### 2.3 Final Counter
For both memory-sharing tests, the final result is the `Final counter` value printed in the host terminal.

---

## 3. CXL.io Test

This test verifies that the host can access the FPGA MMIO space through the BAR/QCSR path.

### Steps
1. **Initialize FPGA:**
   ```bash
   cd sw
   ./run_riscfree.sh          # only when opening RiscFree is needed
   cd 1-1_CXL_io
   ./run_init.sh              # Enter 'y' once when asked
   ```
2. **Run Test:** After `Initiation Done!` appears, run:
   ```bash
   ./run_cxl_io_test.sh
   ```

**Expected Result:** The program prints a sequence of MMIO read/write checks and reports whether the written value matches the readback value.

---

## 4. CXL.mem Test

This test verifies that the host can access a portion of device memory through the DMA path.

### Steps
1. **Initialize FPGA:**
   ```bash
   cd sw
   ./run_riscfree.sh          # only when opening RiscFree is needed
   cd 1-2_CXL_mem
   ./run_init.sh              # Enter 'y' once when asked
   ```
2. **Run Test:** After `Initiation Done!` appears, run:
   ```bash
   ./run_cxl_mem_test.sh
   ```

**Expected Result:** The program performs multiple device-memory write/readback checks and prints pass/fail messages for each address.

---

## 5. CXL.cache Validation

Although `sw/1-3_CXL_cache/` contains source files, the code is identical to the memory coherency tests. Therefore, there is no separate script for it.

Completing the subsequent **Host memory sharing** and **Device memory sharing** tests is sufficient to verify support for CXL.cache. This is because satisfying atomic access on shared memory requires not only support for the CXL.cache protocol, but also a guarantee of memory coherency.

---

## 6. Device Memory Sharing Test

**Test Flow:** `Device first` -> `Host second`

### Steps
1. **Launch RiscFree:**
   ```bash
   cd sw
   ./run_riscfree.sh
   ```
2. **Initialize the FPGA and host environment:**
   ```bash
   cd 3_DeviceMem_sharing
   ./run_init.sh
   ```
   *(Enter `y` once when prompted. Continue only after `Initiation Done!` is printed.)*
3. **Build the device-side project in RiscFree:**
   * Right-click **`DeviceMem_sharing`** -> Select **Clean Project** -> Select **Build Project**. *(Use **Refresh** first if the view is stale).*
4. **Start device execution in RiscFree:**
   * Right-click **`260306_test`** -> Select **Debug As** -> Select **1 Ashling ...**
5. **Run to the synchronization end point:**
   * In `main.c`, find `end = 1;`. Right-click that line and select **Run to Line**.
6. **Run the host-side program:**
   ```bash
   ./run_host.sh
   ```
   *(Optional: run with `./run_host.sh -n 5000` to set increment count).*
7. **Check the final result:** Verify the `Final counter` value printed in the terminal.

---

## 7. Host Memory Sharing Test

**Test Flow:** `Host first` -> `Device second`

### Steps
1. **Launch RiscFree:**
   ```bash
   cd sw
   ./run_riscfree.sh
   ```
2. **Initialize the FPGA and host environment:**
   ```bash
   cd 2_HostMem_sharing
   ./run_init.sh
   ```
   *(Enter `y` once when prompted. Continue only after `Initiation Done!` is printed.)*
3. **Run the host-side program first:**
   ```bash
   ./run_host.sh
   ```
   *(Optional: run with `./run_host.sh -n 5000` to set increment count).*
4. **Build the device-side project in RiscFree:**
   * Right-click **`HostMem_sharing`** -> Select **Clean Project** -> Select **Build Project**.
5. **Start device execution in RiscFree:**
   * Right-click **`HostMem_sharing`** -> Select **Debug As** -> Select **1 Ashling ...**
6. **Run to the synchronization end point:**
   * In `main.c`, find `end = 1;`. Right-click that line and select **Run to Line**.
7. **Check the final result:** Verify the `Final counter` value printed in the terminal.

---

## 8. Notes on Increment Count

For the memory-sharing tests, the host script supports modifying the number of host-side increment operations using the `-n` flag:

```bash
./run_host.sh -n [increment_count]

# Example:
./run_host.sh -n 1000
```

> **Note:** To compare host and device contributions symmetrically, match the host increment count with the device-side increment constant in the device source.

---

## 9. Expected Output Summary

### CXL.io
* BAR/QCSR read/write test messages
* PASS/WARN/FAIL readback logs

### CXL.mem
* Device-memory DMA read/write test messages
* PASS/WARN/FAIL readback logs

### Memory Sharing
* Handshake progress
* Increment execution
* Final output: `Final counter = ...` (This printed value is the main result to check).