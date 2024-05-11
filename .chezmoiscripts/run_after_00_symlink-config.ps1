If ($PSVersionTable.PSVersion.Major -Le 5 -Or $isWindows) {
  # symlink the nvim folder into the correct location for windows
  If (-Not (Test-Path $env:LOCALAPPDATA\nvim)) {
    New-Item -ItemType Junction -Path $env:LOCALAPPDATA\nvim -Value $env:USERPROFILE\.config\nvim
  }

  # symlink powershell profile
  # as OneDrive syncs this file we must over copy it, not symlink or junction
  $ConfigFolder = Split-Path $PROFILE.CurrentUserCurrentHost
  $ConfigFile = "$ConfigFolder\powershell.config.json"
  Copy-Item -Path $env:USERPROFILE\.config\powershell\profile.ps1 -Destination $Profile
  Copy-Item -Path $env:USERPROFILE\.config\powershell\powershell.config.json -Destination $ConfigFile

  # symlink alacritty config
  If (-Not (Test-Path $env:APPDATA\alacritty)) {
    New-Item -ItemType Junction -Path $env:APPDATA\alacritty -Value $env:USERPROFILE\.config\alacritty
  }

  # symlink email autohotkey script
  $StartupFolder = [Environment]::GetFolderPath('Startup')
  If (-Not (Test-Path $StartupFolder\email.ahk.lnk)) {
    New-Item -ItemType SymbolicLink -Path $StartupFolder\email.ahk.lnk -Target $env:USERPROFILE\email.ahk
  }

  #enable komorebi to start automatically
  komorebic.exe enable-autostart --whkd
}
