param(
  [Parameter(Mandatory)]
  [string]$Version
)

if ((Get-Command "dcli.exe" -ErrorAction SilentlyContinue) -eq $null)
{
  curl -L https://github.com/Dashlane/dashlane-cli/releases/download/$Version/dcli-win-x64-signed.exe > $Env:USERPROFILE\.local\bin\dcli.exe
}
