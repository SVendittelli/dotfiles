# Based upon: https://blog.simontimms.com/2021/06/11/installing-fonts/
Write-Header "Installing fonts..."

$Fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)

foreach($File in Get-ChildItem -Path $Env:USERPROFILE\fonts -File *.ttf)
{
  $FileName = $File.Name
  if (-not(Test-Path -Path "C:\Windows\Fonts\$FileName" )) {
        $Fonts.CopyHere($File.fullname) # Installs the font
        Copy-Item -Path $File.fullname -Destination "C:\Windows\Fonts\$FileName" # Moves the font to the folder so we don't install multiple times
    }
}

Write-Done
