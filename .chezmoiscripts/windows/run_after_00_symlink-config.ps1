If ($PSVersionTable.PSVersion.Major -Le 5 -Or $isWindows) {
  Write-Header "Symlinking config..."

  # Create some reusable variables
  $UserConfigFolder = "$env:USERPROFILE\.config"
  $StartupFolder = [Environment]::GetFolderPath('Startup')

  # symlink the nvim folder into the correct location for windows
  $LinkPath = "$env:LOCALAPPDATA\nvim"
  $TargetPath = "$UserConfigFolder\nvim"
  If (-Not (Test-Path $LinkPath) -And (Test-Path $TargetPath)) {
    New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath
  }

  # copy powershell profile as OneDrive syncs this file we must over copy it,
  # not create a symlink
  $ConfigFolder = "$UserConfigFolder\powershell"
  $ProfileFolder = Split-Path -Parent $Profile
  $DestinationFile = "$ProfileFolder\powershell.config.json"
  Copy-Item -Path "$ConfigFolder\powershell.config.json" -Destination $DestinationFile
  Copy-Item -Path "$ConfigFolder\profile.ps1" -Destination $ProfileFolder

  # symlink alacritty config
  $LinkPath = "$env:APPDATA\alacritty"
  $TargetPath = "$UserConfigFolder\alacritty"
  If (-Not (Test-Path $LinkPath) -And (Test-Path $TargetPath)) {
    New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath
  }

  # symlink email autohotkey script to the startup folder
  $LinkPath = "$StartupFolder\email.ahk"
  $TargetPath = "$env:USERPROFILE\email.ahk"
  If (-Not (Test-Path $LinkPath) -And (Test-Path $TargetPath)) {
    New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath
  }

  # symlink slumber config
  $LinkPath = "$env:APPDATA\slumber\config.yml"
  $TargetPath = "$UserConfigFolder\slumber\config.yml"
  If (-Not (Test-Path $LinkPath) -And (Test-Path $TargetPath)) {
    # Ensure slumber config folder exists
    New-Item -ItemType Directory -Path $(Split-Path $LinkPath -Parent) -Force
    New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath
  }

  # create shortcut for Obsidian in the startup folder
  $LinkPath = "$StartupFolder\obsidian.lnk"
  $TargetPath = "$env:LOCALAPPDATA\Programs\Obsidian\obsidian.exe"
  If (-Not (Test-Path $LinkPath) -And (Test-Path $TargetPath)) {
    $Link = (New-Object -ComObject WScript.Shell).CreateShortcut($LinkPath)
    $Link.TargetPath = $TargetPath
    $Link.Save()
  }

  #enable komorebi to start automatically
  komorebic.exe enable-autostart --whkd --bar > $null

  Write-Done
}
