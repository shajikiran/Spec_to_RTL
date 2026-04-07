Write-Host "Enable WSL and VirtualMachinePlatform from an elevated PowerShell session." -ForegroundColor Cyan
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Write-Host "Reboot is typically required after enabling the features." -ForegroundColor Yellow
Write-Host "After reboot, install Ubuntu 22.04 with:" -ForegroundColor Cyan
Write-Host "  wsl --install -d Ubuntu-22.04"
