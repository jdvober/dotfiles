#! /bin/bash 
picom -b --experimental-backends --config /home/jdv/github.com/jdvober/dotfiles/.config/picom/picom_custom.conf &
# picom &
numlockx &
# nm-applet --indicator &
nitrogen --restore &
# polybar -c ~/.config/polybar/config.ini mainbar-qtile &
# piactl disconnect &&
piactl connect
rclone mount --daemon google-drive-work: ~/google-drive-work
# Set brightness of /sys/class/backlight/intel_backlight/brightness (which has been set to rw-rw-rw so we can edit it with this command)
echo "4648" > /sys/class/backlight/intel_backlight/brightness
