# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
case "$TERM" in
xterm*|alacritty)
    PS1='\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    ;;
screen*)
    PS1='\[\033k\033\\\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    ;;
*)
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    ;;
esac
