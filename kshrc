case "$-" in *i*)
	# interactive mode settings go here
    case "$TERM" in
    xterm*|alacritty)
        PS1='\[\033]0;\u@\h:\w\007\]\A\[\033[32m\]\u@\h:\[\033[0m\]\[\033[31m\]\w\[\033[0m\]\$ '
        ;;
    screen*)
        PS1='\[\033k\033\\\\\]\[\033[32m\]\u@\h:\[\033[0m\]\[\033[31m\]\w\[\033[0m\]\$ '
        ;;
    *)
        PS1="\u@\h: \w \$ "
        ;;
    esac
	set -o emacs
	;;
esac

#For OpenBSD
#export LSCOLORS="4x5x2x3x1x464301060203"
#alias ls='colorls -G'
#For Linux
alias ls='ls --color=auto'
