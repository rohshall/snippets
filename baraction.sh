# network status
network() {
wifi="$(ip a | grep wlo1 | grep inet | wc -l)"
wire="$(ip a | grep enp1s0 | grep inet | wc -l)"
if [ $wire = 1 ]; then
    echo " "
elif [ $wifi = 1 ]; then
    echo " "
else
    echo "睊"
fi
}

# volume status
vol() {
    #volstat=$(pamixer --get-volume-human)
    volstat=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
    vol=$(echo "$volstat")
    volicon="墳"
    echo "$volicon $vol"
}

# used storage
hdd() {
    hdd="$(df -h /home | grep /dev | awk '{print $3 " / " $2}')"
    echo "$hdd"
}

# available ram
mem() {
    used="$(free -h | grep Mem: | awk '{print $3}')"
    #total="$(free | grep Mem: | awk '{print $2}')"
    #totalh="$(free -h | grep Mem: | awk '{print $2}' | sed 's/Gi/G/')"
    ram="$used"
    echo $ram
}

# Cpu things
cpu() {
    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.5
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
    echo -e "  $cpu%"
}

# Loop to update bar output
update(){
	#echo " $(cpu)+@fg=3; +@bg=1;+@fg=1;  $(mem)  +@fg=4;+@bg=2;+@fg=1;  $(hdd) +@fg=5;+@bg=3;+@fg=1; $(vol) +@fg=7;+@bg=5;+@fg=1; $(bat) +@fg=8;+@bg=6;+@fg=1; $(network) +@fg=1;+@bg=0;"
	echo " +@fg=3; +@bg=1;+@fg=1;  $(mem)  +@fg=4;+@bg=2;+@fg=1;  $(hdd) +@fg=5;+@bg=3;+@fg=1; $(vol) +@fg=7;+@bg=5;+@fg=1;+@bg=6;+@fg=1; $(network) +@fg=1;+@bg=0;"
    wait
}
while :; do
		update
		#~/.config/spectrwm/scripts/trayer_follows_ws.sh
    sleep 2 &
    wait
done
