# ~/.local/bin/starship-custom-chezmoi-command.ps1
# =============================================================================
# Add chezmoi status to starship prompt

&chezmoi git -- diff --quiet HEAD *> $NUL
if ($LASTEXITCODE -ne 0) {
    $Changes = '!'
} else {
    $Changes = ''
}

if ($(chezmoi git -- rev-list --count origin..HEAD) -gt 0) {
    $Ahead = '+'
} else {
    $Ahead = ''
}
if ($(chezmoi git -- rev-list --count HEAD..origin) -gt 0) {
    $Behind = '-'
} else {
    $Behind = ''
}

return "[$($Changes)$($Ahead)$($Behind)]"
