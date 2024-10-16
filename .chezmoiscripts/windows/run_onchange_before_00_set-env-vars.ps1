# Set user environment variables that need to defined outside of a shell context.
Write-Host ""
Write-Host "Setting user environment variables..."
Write-Host ""

## Set XDG Paths
[System.Environment]::SetEnvironmentVariable('XDG_CONFIG_HOME',"$Env:USERPROFILE\.config", 'User')
[System.Environment]::SetEnvironmentVariable('XDG_DATA_HOME',"$Env:USERPROFILE\.local\share", 'User')
[System.Environment]::SetEnvironmentVariable('XDG_STATE_HOME',"$Env:USERPROFILE\.local\state", 'User')

## Disable powershell telemetry, this needs to be set before the shell loads
[System.Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT','1', 'User')

## Set the path to the komorebi config directory
[System.Environment]::SetEnvironmentVariable('KOMOREBI_CONFIG_HOME',"$Env:USERPROFILE\.config\komorebi", 'User')
