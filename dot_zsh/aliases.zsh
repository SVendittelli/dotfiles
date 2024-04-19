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
alias lg='lazygit'
alias x="exit"

## Vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

##edit and reload zsh config
alias zshconfig="chezmoi edit --apply ~/.zshrc"
alias reload="source ~/.zshenv && source ~/.zshrc"

## Edit dotfiles
alias edf="(cd $(chezmoi source-path) && $EDITOR .)"
alias udf="chezmoi update && reload"

## Edit NixOS config
alias enos="(cd ~/nixos && $EDITOR)"
alias anos="~/nixos/nixos-rebuild.sh"

# List processes on port
function on-port {
    lsof -i :"$@"
}

