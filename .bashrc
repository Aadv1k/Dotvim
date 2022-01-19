#!/bin/bash
HISTSIZE= HISTFILESIZE= # infinite
color_prompt=yes
shopt -s autocd
set -o vi

# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

fortune | cowsay -f tux

# WSL SPECIFIC
alias wincd="cd /mnt/c/users/aadv1k/"
alias winr="powershell.exe $1 $2 $3 $4"
alias gitcd="cd /mnt/c/users/aadv1k/documents/github"

RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
CYAN="\[\e[35m\]"
MAGENTA="\[\e[36m\]"
GRAY="\[\e[90m\]"
ENDCOLOR="\[\e[0m\]"

CURRENT="${RED}[${ENDCOLOR}${YELLOW}\u${ENDCOLOR}${GRAY}@${ENDCOLOR}${GREEN}\h${ENDCOLOR} ${CYAN}\W${ENDCOLOR}${RED}]${ENDCOLOR}\n"
PS1="${CURRENT}\`if [ \$? = 0 ]; then echo ${BLUE}\>${ENDCOLOR}; else echo ${RED}X${ENDCOLOR}; fi\` "


export PATH=~/.cargo/bin/:$PATH
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
