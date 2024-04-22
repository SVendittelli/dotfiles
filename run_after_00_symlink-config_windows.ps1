If ($PSVersionTable.PSVersion.Major -Le 5 -Or $isWindows) {
  # symlink the nvim folder into the correct location for windows
  If (-Not (Test-Path $env:LOCALAPPDATA\nvim)) {
    New-Item -Path $env:LOCALAPPDATA\nvim -ItemType Junction -Value $env:USERPROFILE\.config\nvim
  }

  # symlink powershell profile
  If (-Not (Test-Path $PROFILE.CurrentUserAllHosts)) {
    New-Item -ItemType SymbolicLink -Path $PROFILE.CurrentUserAllHosts -Target $env:USERPROFILE\.config\powershell\profile.ps1
  }

  # symlink powershell profile
  If (-Not (Test-Path $env:APPDATA\alacritty\alacritty.toml)) {
    New-Item -ItemType SymbolicLink -Path $env:APPDATA\alacritty\alacritty.toml -Target $env:USERPROFILE\.config\alacritty\alacritty.toml
  }

  # symlink email autohotkey script
  $StartupFolder = [Environment]::GetFolderPath('Startup')
  If (-Not (Test-Path $StartupFolder\email.ahk.lnk)) {
    echo $StartupFolder\email.ahk.lnk
    New-Item -ItemType SymbolicLink -Path $StartupFolder\email.ahk.lnk -Target $env:USERPROFILE\email.ahk
  }

  #enable komorebi to start automatically
  komorebic.exe enable-autostart --whkd
}

