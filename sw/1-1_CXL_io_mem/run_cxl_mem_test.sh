#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./build_and_run.sh [BDF]
# Example:
#   ./build_and_run.sh 0000:41:00.0

BDF="${1:-0000:41:00.0}"

SRC_MAIN="src/cxl_mem_test.c"
SRC_VFIO="src/bwvfio.c"
OUT="src/cxl_mem_test"

gcc -O2 -g -std=gnu11 -Wall -Wextra -I. \
  "$SRC_MAIN" "$SRC_VFIO" \
  -lnuma \
  -o "$OUT"

echo "[OK] build: ./$OUT"

if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
  echo "[INFO] not root -> running with sudo"
  exec sudo "./$OUT" "$@"
else
  exec "./$OUT" "$@"
fi