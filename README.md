# CXL Memory Coherency Validation Suite

This repository contains host-side and device-side test programs for validating basic CXL functionality on the FPGA platform, including:

* **CXL.io MMIO access**
* **CXL.mem device-memory read/write**
* **Host-memory sharing between Host and Device (CXL.cache support verified)**
* **Device-memory sharing between Host and Device (CXL.cache support verified)**

The software is organized to support both Linux host execution and bare-metal debugging on the HPS through RiscFree.

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

#### `1-1_CXL_io/`

CXL.io validation. This test checks whether the host can access FPGA BAR space through PCIe/CXL.io and confirm read/write behavior.

#### `1-2_CXL_mem/`

CXL.mem validation. This test checks whether the host can read and write a portion of device memory through the DMA-based path.

#### `2_HostMem_sharing/`

Host-memory sharing test. In this mode, the host starts first, initializes the shared memory region, and the device starts later to issue the request and participate in the synchronized increment test.

#### `3_DeviceMem_sharing/`

Device-memory sharing test. In this mode, the device starts first, then the host starts later and participates in the synchronized increment test.

#### `run_riscfree.sh`

Launches the RiscFree workspace for the provided HPS projects.

#### `fpga_image.rbf`

FPGA bitstream used by the initialization scripts.

## 2. Prerequisites

Before running the tests, make sure the following environment is available:

* Linux host system with access to the FPGA card
* BittWare utilities installed:

  * `bw_bmc_configure`
  * `bw_bmc_fpga_load`
* PCIe utilities installed:

  * `lspci`
* `sudo` permission
* `gcc`
* `libnuma`
* RiscFree installed and callable as `RiscFree`
* JTAG/debug connection for HPS bring-up through RiscFree

## 3. General Notes

### FPGA Initialization

Each test directory contains a `run_init.sh` script. This script:

* Reboots the BMC
* Loads the FPGA bitstream
* Rescans PCIe
* Checks the PCIe link and device enumeration
* Waits for HPS boot
* Prints `Initiation Done!` on success

When prompted during BMC reboot, enter:

```bash
y
```

If `OK` does not appear, retry the initialization script.

### RiscFree

Open RiscFree only when needed:

```bash
cd sw
./run_riscfree.sh
```

### Final Counter

For both memory-sharing tests, the final result is the `Final counter` value printed in the host terminal.

## 4. CXL.io Test

This test verifies that the host can access the FPGA MMIO space through the BAR/QCSR path.

### Steps

```bash
cd sw
./run_riscfree.sh          # only when opening RiscFree is needed
cd 1-1_CXL_io
./run_init.sh
```

Enter `y` once when asked.

After `Initiation Done!` appears, run:

```bash
./run_cxl_io_test.sh
```

### Expected Result

The program prints a sequence of MMIO read/write checks and reports whether the written value matches the readback value.

## 5. CXL.mem Test

This test verifies that the host can access a portion of device memory through the DMA path.

### Steps

```bash
cd sw
./run_riscfree.sh          # only when opening RiscFree is needed
cd 1-2_CXL_mem
./run_init.sh
```

Enter `y` once when asked.

After `Initiation Done!` appears, run:

```bash
./run_cxl_mem_test.sh
```

### Expected Result

The program performs multiple device-memory write/readback checks and prints pass/fail messages for each address.

## 6. CXL.CACHE Validation

Although `/sw/1-3_CXL_CACHE` contains source files, the code is identical to the following memory coherency tests. Therefore, there is no separate script for it, and completing the subsequent Host memory sharing and Device memory sharing tests is sufficient to verify support for CXL.cache as well.

This is because satisfying atomic access on shared memory requires not only support for the CXL.cache protocol, but also a guarantee of memory coherency.

## 7. Device Memory Sharing Test

In this flow, the device runs first, then the host runs second.

### Test Flow

* **Device first**
* **Host second**

### Steps

#### 0. Move to the software directory

```bash
cd sw
```

#### 1. Launch RiscFree

Only needed when opening RiscFree:

```bash
./run_riscfree.sh
```

#### 2. Initialize the FPGA and host environment

```bash
cd 3_DeviceMem_sharing
./run_init.sh
```

**Notes:**

* Enter `y` once when prompted.
* If `OK` does not appear, retry.
* Continue only after `Initiation Done!` is printed.

#### 3. Build the device-side project in RiscFree

In RiscFree:

* Right-click **`DeviceMem_sharing`** (or the relevant project folder)
* Select **Clean Project**
* Then select **Build Project**

This is mainly required:

* on the first run
* after recompilation
* after source changes

If the project view is stale, use **Refresh** first.

#### 4. Start device execution in RiscFree

In RiscFree:

* Right-click **`260306_test`** or the relevant project folder
* Select **Debug As**
* Select **1 Ashling ...**

If an `invalid target...` message appears, refer to your existing target/debug configuration note.

#### 5. Run to the synchronization end point

In `main.c`, find:

```c
end = 1;
```

Right-click that line and select:

* **Run to Line**

#### 6. Run the host-side program

```bash
./run_host.sh
```

Optional increment count:

```bash
./run_host.sh -n [increment_count]
```

Example:

```bash
./run_host.sh -n 5000
```

#### 7. Check the final result

The final result is the `Final counter` value printed in the terminal.

## 7. Host Memory Sharing Test

In this flow, the host runs first, then the device runs second.

### Test Flow

* **Host first**
* **Device second**

### Steps

#### 1. Move to the software directory

```bash
cd sw
```

#### 2. Launch RiscFree

Only needed when opening RiscFree:

```bash
./run_riscfree.sh
```

#### 3. Initialize the FPGA and host environment

```bash
cd 2_HostMem_sharing
./run_init.sh
```

**Notes:**

* Enter `y` once when prompted.
* If `OK` does not appear, retry.
* Continue only after `Initiation Done!` is printed.

#### 4. Run the host-side program first

```bash
./run_host.sh
```

Optional increment count:

```bash
./run_host.sh -n [increment_count]
```

Example:

```bash
./run_host.sh -n 5000
```

#### 5. Build the device-side project in RiscFree

In RiscFree:

* Right-click **`HostMem_sharing`** (or the relevant project folder)
* Select **Clean Project**
* Then select **Build Project**

This is mainly required:

* on the first run
* after recompilation
* after source changes

If needed, use **Refresh** first.

#### 6. Start device execution in RiscFree

In RiscFree:

* Right-click **`HostMem_sharing`** (or the relevant project folder)
* Select **Debug As**
* Select **1 Ashling ...**

#### 7. Run to the synchronization end point

In `main.c`, find:

```c
end = 1;
```

Right-click that line and select:

* **Run to Line**

#### 8. Check the final result

The final result is the `Final counter` value printed in the terminal.

## 9. Notes on Increment Count

For the memory-sharing tests, the host script supports:

```bash
-n [increment_count]
```

This changes the number of host-side increment operations.

Example:

```bash
./run_host.sh -n 1000
```

To compare host and device contributions symmetrically, match the host increment count with the device-side increment constant in the device source.

## 10. Expected Output Summary

### CXL.io

* BAR/QCSR read/write test messages
* PASS/WARN/FAIL readback logs

### CXL.mem

* Device-memory DMA read/write test messages
* PASS/WARN/FAIL readback logs

### Memory Sharing

* Handshake progress
* Increment execution
* Final output:

```text
Final counter = ...
```

This printed `Final counter` is the main result to check.

