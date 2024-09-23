# ~/.local/bin/starship-custom-chezmoi-when.ps1
# =============================================================================
# Only show chezmoi status when there are changes

$LocalCommit = chezmoi git rev-parse HEAD
$RemoteCommit = chezmoi git rev-parse origin

&chezmoi git -- diff --quiet HEAD *> $NUL
if ($LASTEXITCODE -ne 0 -or ($LocalCommit -ne $RemoteCommit)) {
    exit 0
} else {
    exit 1
}
