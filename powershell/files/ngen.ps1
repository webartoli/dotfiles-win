$env:path = [Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()
[AppDomain]::CurrentDomain.GetAssemblies() | % {
  if (! $_.location) {continue}
  $Name = Split-Path $_.location -leaf
  Write-Host -ForegroundColor Yellow "NGENing : $Name"
  ngen install $_.location | % {"`t$_"}
}

# https://social.technet.microsoft.com/Forums/windows/en-US/c777c2dc-0014-4ec6-b2ba-9711121f63d5/powershell-slow-to-start-on-clean-install-with-empty-profile-present?forum=w8itprogeneral