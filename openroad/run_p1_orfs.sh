#!/usr/bin/env bash
set -euo pipefail

REPO_WIN_PATH="/mnt/c/Users/kyash/spec2rtl_agent"
ORFS_DIR="${HOME}/OpenROAD-flow-scripts"
DESIGN_CONFIG="${REPO_WIN_PATH}/openroad/p1/config.mk"

if [[ ! -d "${ORFS_DIR}" ]]; then
  sudo apt update
  sudo apt install -y git
  git clone https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git "${ORFS_DIR}"
fi

cd "${ORFS_DIR}"

if [[ ! -x "${ORFS_DIR}/tools/install.sh" ]]; then
  echo "Unexpected ORFS checkout state: tools/install.sh not found" >&2
  exit 1
fi

./setup.sh
cd flow
make DESIGN_CONFIG="${DESIGN_CONFIG}"

echo
echo "If the run succeeds, look for GDS here:"
echo "  ${ORFS_DIR}/flow/results/nangate45/seq_detector_0011/base/6_final.gds"
