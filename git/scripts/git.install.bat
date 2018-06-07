@@:: This prolog allows a PowerShell script to be embedded in a .CMD file.


@@:: Any non-PowerShell content must be preceeded by "@@"


@@setlocal


@@set POWERSHELL_BAT_ARGS=%*


@@if defined POWERSHELL_BAT_ARGS set POWERSHELL_BAT_ARGS=%POWERSHELL_BAT_ARGS:"=\"%


@@PowerShell -Command Invoke-Expression $('$args=@(^&{$args} %POWERSHELL_BAT_ARGS%);'+[String]::Join(';',$((Get-Content '%~f0') -notmatch '^^@@'))) & pause & goto :EOF

Set-ExecutionPolicy Bypass -Scope Process -Force
"Installing chocolatey windows package manager ..."
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
"Installing git"
choco install git.install -y
"Done. You can close this window now."
