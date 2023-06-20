export EDITOR=vim
export FCEDIT=$EDITOR
export PAGER=less
export LESS='-iMRS -x2'
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export CLICOLOR=1
HISTFILE=$HOME/.ksh_history
HISTSIZE=20000

# emacs mode gives you the familiar Ctrl-A, Ctrl-E, etc
set -o emacs

shopt -s checkwinsize 2>/dev/null

_cmd_status() {
    if [ $? -eq 0 ]; then
        printf '\001\002✔'
    else
        printf '\001\002✘'
    fi
}

_git_branch() {
    _br="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"

    if [ -n "$_br" ]; then
        printf '\001\002[\001\002'"${_br}"'\001\002]\001\002'
    fi
}

tab_title() {
  echo -n -e "\033]0;${PWD##*/}\007"
}

export PS1='$(tab_title)\033[32m$USER\033[33m[$PWD]\033[36m`_cmd_status` `_git_branch`\$ \033[0m'