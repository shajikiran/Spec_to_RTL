# OpenROAD / ORFS setup for `p1_design.v`

This repository now contains the minimum design collateral to run `rtl/p1_design.v`
through OpenROAD-flow-scripts as top module `seq_detector_0011`.

Files:

- `openroad/p1/config.mk`
- `openroad/p1/constraint.sdc`
- `openroad/setup_wsl_openroad.ps1`
- `openroad/run_p1_orfs.sh`

## What is blocked

This current Codex session does not have administrator rights to enable Windows
features such as WSL, and native Windows OpenROAD flow execution is not the
supported path for ORFS.

## What to run

1. Open an **Administrator PowerShell** and run:

```powershell
powershell -ExecutionPolicy Bypass -File C:\Users\kyash\spec2rtl_agent\openroad\setup_wsl_openroad.ps1
```

2. Reboot if Windows requests it.

3. Install Ubuntu 22.04:

```powershell
wsl --install -d Ubuntu-22.04
```

4. Inside the Ubuntu shell, run:

```bash
bash /mnt/c/Users/kyash/spec2rtl_agent/openroad/run_p1_orfs.sh
```

## Expected artifact

If the flow completes, the GDSII file should be at:

`~/OpenROAD-flow-scripts/flow/results/nangate45/seq_detector_0011/base/6_final.gds`
