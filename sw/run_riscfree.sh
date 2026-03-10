#!/usr/bin/env bash
set -euo pipefail

# 기본 프로젝트(워크스페이스) 경로
DEFAULT_WS="../riscfree"

# 첫 번째 인자로 경로를 주면 그걸 사용, 아니면 기본값 사용
WS_DIR="${1:-$DEFAULT_WS}"
WS_DIR="$(realpath "$WS_DIR")"

if [[ ! -d "$WS_DIR" ]]; then
  echo "[ERROR] workspace dir not found: $WS_DIR" >&2
  exit 1
fi


if [[ -z "RiscFree" ]]; then
  echo "[ERROR] RiscFree executable not found." >&2
  echo "        Try: export RISCFREE_HOME=/path/to/riscfree_install_dir" >&2
  exit 2
fi


# Eclipse 기반 IDE: -data 로 워크스페이스 지정
exec "RiscFree" -data "$WS_DIR"