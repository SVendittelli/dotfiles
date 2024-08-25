# Dot Files

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)

My dot files for zsh, vim, tmux, etc.

Managed using [chezmoi](https://www.chezmoi.io/).

## Installation

### Linux

Install `chezmoi` using the correct package manager.

```shell
export PATH="$HOME/.local/bin/:$PATH"
chezmoi init SVendittelli
chezmoi apply ~/.local/bin/dcli
dcli sync
chezmoi apply ~/.keys
chezmoi apply
```

#### WSL

On Windows Subsystem for Linux you may additionally need to run these commands:

```shell
rustup default stable
```

### macOS

Install homebrew:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install `chezmoi` and initialise:

```shell
brew install chezmoi
chezmoi init SVendittelli
chezmoi apply ~/.local/bin/dcli
dcli sync
chezmoi apply ~/.keys
chezmoi apply
```

### Windows

Back in the _administrator_ shell:

```powershell
# Enable developer mode
Set-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Appx"`
                 -Name "AllowDevelopmentWithoutDevLicense"`
                 -Type "DWord"`
                 -Value "1"

# Set the execution policy
Set-ExecutionPolicy remotesigned

# Temporarily add the user's bin directory to the path for the password manager
$Env:PATH += ";$Env:USERPROFILE\.local\bin"

# Trust the PSGallery repository
Set-PSResourceRepository -Name PSGallery -Trusted

# Initialise chezmoi
chezmoi init SVendittelli
chezmoi apply ~/.local/bin/dcli.exe
dcli sync
chezmoi apply ~/.keys
chezmoi apply
```

## Set up pre-commit

Run git hooks on commit and push using [pre-commit](https://pre-commit.com/):

```shell
chezmoi cd
pre-commit install
exit
```

## Clear the state of all `run_onchange_` and `run_once_` scripts

`chezmoi` stores whether and when `run_onchange_` and `run_once_` scripts have been run in its persistent state.

To clear the state of `run_onchange_` scripts, run:

```shell
just clear-run-on-change-state
```

To clear the state of `run_once_` scripts, run:

```shell
just clear-run-once-state
```
