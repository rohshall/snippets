# use UTF-8 everywhere
export LANG=en_US.UTF-8

# specify location of kshrc
export ENV=$HOME/.kshrc

xrdb -merge $HOME/.Xdefaults

# set your background color
xsetroot -solid dimgray

# disable system beep
xset b off

exec bspwm
