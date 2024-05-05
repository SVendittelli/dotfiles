If ($PSVersionTable.PSVersion.Major -Le 5 -Or $isWindows) {
  # symlink the nvim folder into the correct location for windows
  If (-Not (Test-Path $env:LOCALAPPDATA\nvim)) {
    New-Item -ItemType Junction -Path $env:LOCALAPPDATA\nvim -Value $env:USERPROFILE\.config\nvim
  }

  # symlink powershell profile
  If (-Not (Test-Path $PROFILE.CurrentUserAllHosts)) {
    New-Item -ItemType SymbolicLink -Path $PROFILE.CurrentUserAllHosts -Target $env:USERPROFILE\.config\powershell\profile.ps1
  }

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
