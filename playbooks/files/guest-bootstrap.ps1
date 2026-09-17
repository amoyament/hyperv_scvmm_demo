# Guest bootstrap script for Option B demo.
# Runs inside the VM via PowerShell Direct (no network management required).
# Creates a marker file proving Ansible configured the guest.

$markerPath = "C:\ProgramData\AnsibleDemo\bootstrap-complete.txt"
$markerDir  = Split-Path $markerPath -Parent

if (-not (Test-Path $markerDir)) {
    New-Item -ItemType Directory -Path $markerDir -Force | Out-Null
}

$content = @"
Bootstrap completed: $(Get-Date -Format o)
Computer: $env:COMPUTERNAME
Demo: Option B - Standard Web Server Build
"@

Set-Content -Path $markerPath -Value $content -Encoding UTF8

Write-Output "Guest bootstrap complete on $env:COMPUTERNAME"
