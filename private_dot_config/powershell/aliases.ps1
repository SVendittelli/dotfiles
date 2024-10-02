# ~/.config/powershell/aliases.ps1
# =============================================================================
# PowerShell aliases sourced by `./profile.ps1`.
#
# Since PowerShell does not allow aliases to contain parameters, most of the
# logic is wrapped in `./functions.ps1`.

# Easier navigation
# -----------------------------------------------------------------------------
Set-Alias -Name "~" -Value Set-LocationHome -Description "Goes to user home directory."
Set-Alias -Name ".." -Value Set-LocationUp -Description "Goes up a directory."
Set-Alias -Name "..." -Value Set-LocationUp2 -Description "Goes up two directories."
Set-Alias -Name "...." -Value Set-LocationUp3 -Description "Goes up three directories."
Set-Alias -Name "....." -Value Set-LocationUp4 -Description "Goes up four directories."
Set-Alias -Name "......" -Value Set-LocationUp5 -Description "Goes up five directories."

# Directory browsing
# -----------------------------------------------------------------------------
Set-Alias -Name "ls" -Value eza -Option AllScope -Description "Lists visible files in a grid."
Set-Alias -Name "l" -Value Get-ChildItemVisible -Description "Lists visible files in a table with headers."
Set-Alias -Name "ll" -Value Get-ChildItemVisible -Description "Lists visible files in a table with headers."
Set-Alias -Name "la" -Value Get-ChildItemAll -Description "Lists all files in a table."
Set-Alias -Name "lt" -Value Get-ChildItemTree -Description "Lists all files in tree."

# File management
# -----------------------------------------------------------------------------

Set-Alias -Name touch -Value New-ItemEmpty -Description "Creates an empty file or updates its timestamp."

# General
# -----------------------------------------------------------------------------

Set-Alias -Name "alias" -Value Get-Aliases -Description "Lists aliases."

# Other useful aliases
# -----------------------------------------------------------------------------
Set-Alias -Name cat -Value bat -Option AllScope
Set-Alias -Name cm -Value chezmoi
Set-Alias -Name e -Value nvim
Set-Alias -Name g -Value git
Set-Alias -Name j -Value just
Set-Alias -Name jg -Value Just-Global
Set-Alias -Name lzd -Value lazydocker
Set-Alias -Name lzg -Value lazygit
Set-Alias -Name neofetch -Value fastfetch
Set-Alias -Name open -Value Invoke-Item
Set-Alias -Name python3 -Value python
Set-Alias -Name tree -Value tre
Set-Alias -Name vim -Value nvim
Set-Alias -Name vi -Value nvim
Set-Alias -Name which -Value Show-Command
