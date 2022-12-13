# First step is to get the ANSI color codes which can be found here: http://pueblo.sourceforge.net/doc/manual/ansi_color_codes.html
# Next is to tailor your prompt. In vi, I used <CTRL>-V and then hit <ESC> to generate a literal 0x1B character. So to # get a blue foreground color, you would do <CTRL>-V<ESC>[34m. With this, my PS1 assignment looks like this:
#
# Code:
#
# PS1='^[[32m$HOSTNAME^[[37m:^[[33m$PWD^[[31m ! ^[[35m\$\$\$ ->^[[0m'
#
# Since different shells have different requirements, you will need to experiment to see what your shell requires. I put this line in my ~/.profile and it works like a charm.
# One more thing, you cannot just mouse copy the above code into your prompt and expect it to work. You MUST do the <CTRL>-V <ESC> sequence to generate the ^[ character, otherwise it's just a carat and a opening bracket.
if [ -f /etc/shrc ]; then
	. /etc/shrc
fi

case "$-" in *i*)
	# interactive mode settings go here
	# nice colored prompt that also sets xterm title
	_XTERM_TITLE='\[\033]0;\u@\h:\w\007\]'
	_PS1_CLEAR='\[\033[0m\]'
	_PS1_BLUE='\[\033[34m\]'
	case "$(id -u)" in
	  0) _PS1_COLOR='\[\033[1;31m\]' ;;
	  *) _PS1_COLOR='\[\033[32m\]'   ;;
	esac
	PS1='$_XTERM_TITLE\A $_PS1_COLOR\u@\h$_PS1_CLEAR:$_PS1_BLUE\w$_PS1_COLOR\$$_PS1_CLEAR '
	set -o emacs
	;;
esac
export LSCOLORS="4x5x2x3x1x464301060203"
alias ls='colorls -G'
