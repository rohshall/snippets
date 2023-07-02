# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
case "$TERM" in
xterm*|alacritty)
    PS1='\[\e]0;\u@\h: \w\a\]\[\033[32m\]\u@\h:\[\033[0m\]\[\033[31m\]\w\[\033[0m\]\$ '
    ;;
screen*)
    PS1='\[\033k\033\\\]\[\033[32m\]\u@\h:\[\033[0m\]\[\033[31m\]\w\[\033[0m\]\$ '
    ;;
*)
    PS1="\u@\h: \w \$ "
    ;;
esac
