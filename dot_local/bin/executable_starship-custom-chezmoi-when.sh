$LocalCommit = git rev-parse HEAD
$RemoteCommit = git rev-parse origin

if [ !(git diff --quiet HEAD *> /dev/null) ] || [ $LocalCommit != $RemoteCommit ] ; then
    exit 0
else
    exit 1
fi
