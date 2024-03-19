# common aliases

## Dirsctories aliases
# Changing/making/removing directory
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

function d() {
    if [[ -n $1 ]]; then
        dirs "$@"
    else
        dirs -v | head -n 10
    fi
}
compdef _dirs d

## ls aliases
alias ls='ls --color=auto'
alias l='ls -lFh'   #size,show type,human readable
alias la='ls -lAFh' #long list,show almost all,show type,human readable
alias lr='ls -tRFh' #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh' #long list,sorted by date,show type,human readable
alias ll='ls -l'    #long list

## Improve grep
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

## Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g I='| grep -i'
alias -g L="| less"
alias -g M="| most"

## Helpful system aliases
alias help='man'
alias p='ps -f'
alias unexport='unset'
alias update="sudo apt update && sudo apt upgrade -y"

## Shorten commands
alias e=$EDITOR
alias g='git'
alias x="exit"

## Reload zsh config
alias reload="source ~/.zshenv && source ~/.zshrc"

## Edit dotfiles
alias edf="chezmoi edit --apply"
alias zshconfig="edf ~/.zshrc"

## Edit NixOS config
alias enos="sudo $EDITOR /etc/nixos"
alias anos="sudo nixos-rebuild switch --flake /etc/nixos#default"

# List processes on port
function on-port {
    lsof -i :"$@"
}
