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
chezmoi init --apply SVendittelli
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
chezmoi init --apply SVendittelli
```

## Set up pre-commit

Run git hooks on commit and push using [pre-commit](https://pre-commit.com/):

```shell
chezmoi cd
pre-commit install
exit
```
