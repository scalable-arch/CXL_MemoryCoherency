#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./build_and_run.sh [BDF]
# Example:
#   ./build_and_run.sh 0000:41:00.0

BDF="${1:-0000:41:00.0}"

SRC_MAIN="Host/main.c"
SRC_VFIO="Host/bwvfio.c"
OUT="Host/host_inc"

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