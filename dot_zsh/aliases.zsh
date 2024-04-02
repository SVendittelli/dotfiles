# common aliases

## ls aliases
alias ls='eza'
alias l='ls -lh'         #size,show type,headers
alias la='ls -lah --git' #long list,show almost all,show type,headers
alias ll='ls -l'         #long list
alias lt='ls -lah --git --git-ignore --tree' #long list,show almost all,show type,headers,follow git ignore,tree

## Helpful system aliases
alias help='tldr'

## Shorten commands
alias e=$EDITOR
alias e.='e .'
alias g='git'
alias x="exit"

## Vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

## Reload zsh config
alias reload="source ~/.zshenv && source ~/.zshrc"

## Edit dotfiles
alias edf="chezmoi edit --apply"
alias zshconfig="edf ~/.zshrc"
alias udf="chezmoi update && reload"

## Edit NixOS config
alias enos="$EDITOR ~/nixos"
alias anos="~/nixos/nixos-rebuild.sh"

# List processes on port
function on-port {
    lsof -i :"$@"
}

