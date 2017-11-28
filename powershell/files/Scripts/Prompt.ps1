function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
    
    $origLastExitCode = $LastExitCode
    
    if (Test-Administrator) {  # if elevated
        Write-Host "[" -NoNewline -ForegroundColor DarkGray
        Write-Host "Elevated" -NoNewline -ForegroundColor White
        Write-Host "] " -NoNewline -ForegroundColor DarkGray
    }

    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }
    $LastExitCode = $origLastExitCode

    Write-Host (Get-Date -Format "HH:mm:ss") -NoNewline -ForegroundColor DarkMagenta
    Write-Host " | " -NoNewline -ForegroundColor DarkGray
    Write-Host $curPath -NoNewline -ForegroundColor Blue
    Write-Host " " -NoNewline -ForegroundColor DarkGray

    Write-VcsStatus

    "`n$('$' * ($nestedPromptLevel + 1)) "
}
