#	$NetBSD: dot.shrc,v 1.3 2007/11/24 11:14:42 pavel Exp $

if [ -f /etc/shrc ]; then
	. /etc/shrc
fi

case "$-" in *i*)
	# interactive mode settings go here
	export e="`echo x | tr x '\033'`"
	export red="${e}[31m"
	export green="${e}[32m"
	export yellow="${e}[33m"
	export blue="${e}[34m"
	export magenta="${e}[35m"
	export cyan="${e}[36m"
	export white="${e}[37m"
	export end="${e}[0m"
	export PS1='${cyan}$(logname)${blue}@$(hostname -s):${magenta}$PWD$ ${end}'
	;;
esac
