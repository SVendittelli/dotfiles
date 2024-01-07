# common aliases
alias ls='ls --color=auto'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

## Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g I='| grep -i'
alias -g L="| less"
alias -g M="| most"

alias help='man'
alias p='ps -f'
alias unexport='unset'

alias g='git'

alias update="sudo apt update && sudo apt upgrade -y"

alias x="exit"

alias edf="chezmoi edit --apply"

alias reload="source ~/.zshenv && source ~/.zshrc"
alias zshconfig="chezmoi edit --apply ~/.zshrc"

# List processes on port
function on-port {
    lsof -i :"$@"
}
