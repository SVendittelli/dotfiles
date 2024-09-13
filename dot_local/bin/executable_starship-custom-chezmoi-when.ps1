$LocalCommit = git rev-parse HEAD
$RemoteCommit = git rev-parse origin

&chezmoi git -- diff --quiet HEAD *> $NUL
if ($LASTEXITCODE -ne 0 -or ($LocalCommit -ne $RemoteCommit)) {
    exit 0
} else {
    exit 1
}
