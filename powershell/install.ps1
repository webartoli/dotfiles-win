Write-Host Installing Powershell profile

$folder = Split-Path -Parent $PROFILE

if (Test-Path $folder) {
    Write-Warning "Folder $folder aready exists: remove existing folder and retry"
}
else {
    New-Item -Path $folder -ItemType SymbolicLink -Value .\files | Out-Null
}

