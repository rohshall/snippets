# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#alias ls='ls --color'
source ~/.git-prompt.sh
PS1="\[\033[01;32m\]\u[\[\033[01;34m\]\w\[\033[00m\]] \[\e[91m\]$(__git_ps1)\[\e[00m\] $ "
source /opt/local/share/fzf/shell/key-bindings.bash
source /opt/local/share/nvm/init-nvm.sh
