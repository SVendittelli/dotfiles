&chezmoi git -- diff --quiet HEAD *> $NUL
if ($LASTEXITCODE -ne 0) {
    exit 0
} else {
    exit 1
}
