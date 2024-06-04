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

On Windows Subsystem for Linux ypu may additionally need to run these commands:

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

In an _administrator_ shell:

```powershell
rundll32 sysdm.cpl,EditEnvironmentVariables
```

Set the following user environment variable:

```toml
KOMOREBI_CONFIG_HOME = "%USERPROFILE%\.config\komorebi"
```

Back in the _administrator_ shell:

```powershell
Set-ExecutionPolicy remotesigned
$Env:PATH += ";$Env:USERPROFILE\.local\bin"
Set-PSResourceRepository -Name PSGallery -Trusted
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

`chezmoi` stores whether and when `run_onchange_` and run_once_` scripts have been run in its persistent state.

To clear the state of `run_onchange_` scripts, run:

```shell
chezmoi state delete-bucket --bucket=entryState
```

To clear the state of `run_once_` scripts, run:

```shell
chezmoi state delete-bucket --bucket=scriptState
```
