Write-Host Installing Git dotfiles

$target = $env:USERPROFILE

$gitconfig = Join-Path $target .gitconfig
$gitignore = Join-Path $target .gitignore

$targetFiles = Test-Path $gitconfig,$gitignore | Where-Object {$_ -eq $true} | Measure-Object

If ($targetFiles.Count -gt 0) {
    Write-Warning ".gitconfig or .gitignore files aready exists on ${target}; remove existing files and retry"
}
else {
    New-Item -Path $gitconfig -ItemType SymbolicLink -Value $(Join-Path .\files .gitconfig) | Out-Null
    New-Item -Path $gitignore -ItemType SymbolicLink -Value $(Join-Path .\files .gitignore) | Out-Null
}
