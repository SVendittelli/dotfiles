# Dot Files

My dot files for zsh, vim, tmux, etc.

Managed using [chezmoi](https://www.chezmoi.io/).

## Linux

Install `chezmoi` using the correct package manager.

```shell
export PATH="$PATH:~/bin"
chezmoi init --apply SVendittelli
```

## macOS

Install homebrew:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install `chezmoi` and initialise:

```shell
brew install chezmoi
chezmoi init --apply SVendittelli
```

## Windows

In an administrator shell:

```powershell
Set-ExecutionPolicy remotesigned
$Env:PATH += ";$Env:USERPROFILE\bin"
chezmoi init --apply SVendittelli
```
