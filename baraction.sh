#!/bin/sh
# Example Bar Action Script for NetBSD.
#

# cache the output of envstat, no need to call that every second.
BAT_LEVEL=""
I=0
while :; do
	if [ $I -eq 0 ]; then
		BAT_LEVEL=`envstat -s 'acpibat0:charge' | awk -F'[()]' 'FNR==3{print $2}'`
	fi
	echo -n "Bat: $BAT_LEVEL"
	echo ""
	I=$(( ( ${I} + 1 ) % 11 ))
	sleep 1
done
