#!/bin/sh
#

screenshot() {
	case $1 in
	full)
        maim -i $(xdotool getactivewindow) ~/Pictures/$(date +%s).png	
		;;
	window)
		sleep 1
		maim ~/Pictures/$(date +%s).png
		;;
	*)
		;;
	esac;
}

screenshot $1
