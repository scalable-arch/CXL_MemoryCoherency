#!/usr/bin/env bash
set -euo pipefail

BDF="41:00.0"
RBF="../fpga_image.rbf"
BMC_WAIT_SEC=2

# 기대하는 lspci 한 줄(정확히 이 문자열이어야 PASS)
EXPECTED_LSPCI_LINE_DEFAULT='Processing accelerators: BittWare, Inc. Device 0076 (rev 01)'

usage() {
  cat <<EOF
Usage: $(basename "$0") -f <bitstream.rbf> [-b <BDF>] [--bmc-wait <sec>]

  -f, --rbf        RBF file to stream-load (required)
  -b, --bdf        PCI BDF to check (default: ${BDF})
      --bmc-wait   Seconds to wait after BMC reboot (default: ${BMC_WAIT_SEC})
EOF
}

# Parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
    -f|--rbf) RBF="$2"; shift 2 ;;
    -b|--bdf) BDF="$2"; shift 2 ;;
    --bmc-wait) BMC_WAIT_SEC="$2"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown arg: $1" >&2; usage; exit 1 ;;
  esac
done

if [[ -z "$RBF" ]]; then
  echo "ERROR: -f/--rbf is required" >&2
  usage
  exit 1
fi
if [[ ! -f "$RBF" ]]; then
  echo "ERROR: RBF not found: $RBF" >&2
  exit 1
fi

for cmd in bw_bmc_configure bw_bmc_fpga_load lspci tee grep; do
  command -v "$cmd" >/dev/null 2>&1 || { echo "ERROR: missing command: $cmd" >&2; exit 1; }
done

# Cache sudo credential early (so sudo prompts once)
sudo -v

echo "[1/5] Rebooting BMC..."
printf "y\n" | bw_bmc_configure reboot

if [[ "$BMC_WAIT_SEC" -gt 0 ]]; then
  echo "[wait] Sleeping ${BMC_WAIT_SEC}s for BMC reboot..."
  sleep "$BMC_WAIT_SEC"
fi

echo "[2/5] Streaming FPGA bitstream: $RBF"
bw_bmc_fpga_load stream "$RBF"

echo "[3/5] PCI rescan..."
echo 1 | sudo tee /sys/bus/pci/rescan >/dev/null
echo "1"

echo "[4/5] PCIe link width check: $BDF"
if ! sudo lspci -s "$BDF" >/dev/null 2>&1; then
  echo "FAIL: Device not found after rescan: $BDF" >&2
  exit 1
fi
sudo lspci -vv -s "$BDF" | grep -i width

echo "[5/5] PCI device identification check: $BDF"
lspci_line="$(sudo lspci -s "$BDF" | head -n 1 || true)"
expected_line="${BDF} ${EXPECTED_LSPCI_LINE_DEFAULT}"

if [[ "$lspci_line" != "$expected_line" ]]; then
  echo "FAIL: Unexpected lspci identification" >&2
  echo "  expected: $expected_line" >&2
  echo "  actual:   $lspci_line" >&2
  exit 1
fi

echo "OK: $lspci_line"

echo "Wait 8s for HPS boot..."
sleep "8"

echo "Initiation Done!"