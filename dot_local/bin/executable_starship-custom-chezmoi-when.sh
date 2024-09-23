# ~/.local/bin/starship-custom-chezmoi-when.sh
# =============================================================================
# Only show chezmoi status when there are changes

$LocalCommit = chezmoi git rev-parse HEAD
$RemoteCommit = chezmoi git rev-parse origin

if [ !(chezmoi git diff --quiet HEAD *> /dev/null) ] || [ $LocalCommit != $RemoteCommit ] ; then
    exit 0
else
    exit 1
fi
