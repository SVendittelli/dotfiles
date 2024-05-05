#!/usr/bin/env bash

# exit immediately if password-manager-binary is already in $PATH
type dcli >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    # commands to install password-manager-binary on Darwin
    brew install dashlane/tap/dashlane-cli
    ;;
Linux)
    # commands to install password-manager-binary on Linux
    curl -L https://github.com/Dashlane/dashlane-cli/releases/download/$1/dcli-linux-x64.exe > $HOME/bin/dcli
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
