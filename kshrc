export EDITOR=nvim
export FCEDIT=$EDITOR
export PAGER=less
export LESS='-iMRS -x2'
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
HISTFILE=$HOME/.ksh_history
HISTSIZE=20000

# emacs mode gives you the familiar Ctrl-A, Ctrl-E, etc
set -o emacs

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

case "$-" in *i*)
	# interactive mode settings go here
    case "$TERM" in
    xterm*|alacritty)
        PS1='\[\033]0;\u@\h:\w\007\]\[\033[32m\]\u@\h:\[\033[0m\]\[\033[31m\]\w `_cmd_status` `_git_branch`\[\033[0m\]\$ '
        ;;
    screen*)
        PS1='\[\033k\033\\\\\]\[\033[32m\]\u@\h:\[\033[0m\]\[\033[31m\]\w `_cmd_status` `_git_branch`\[\033[0m\]\$ '
        ;;
    *)
        PS1="\u@\h: \w \$ "
        ;;
    esac
	;;
esac


#For OpenBSD
export LSCOLORS=fxexcxdxbxegedabagacad
#For NetBSD
#export LSCOLORS="4x5x2x3x1x464301060203"
alias ls='colorls -G'
#For Linux
#alias ls='ls --color=auto'
