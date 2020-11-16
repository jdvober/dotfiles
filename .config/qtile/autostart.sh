#! /bin/bash 
picom -b --experimental-backends --config /home/jdv/github.com/jdvober/dotfiles/.config/picom/picom_custom_3.conf &
# picom &
numlockx &
# nm-applet --indicator &
nitrogen --restore &
# polybar -c ~/.config/polybar/config.ini mainbar-qtile &
piactl disconnect &&
piactl connect
