#!/bin/sh


# Compositor - picom
killall picom
logger "autostart.sh: [picom] has been killed"
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config $HOME/.config/picom/picom.conf --vsync &
logger "autostart.sh: [picom] has been started"

# Notification
# killall dunst
# while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done
# while :;
#  logger "xxxxxxxxxxxxxxxxxxxxxxxxxx"
#  do
#  if pgrep -u $UID -x dunst >/dev/null; then
#     logger "XXXXXXdunst has started"
#     break
#  else
#     sleep 1
#     break
#     dunst -conf $HOME/.config/dunst/dunst.conf
#  fi
# done

# Password Manager
# keepassxc &


# background
feh --bg-fill $HOME/.config/i3/wallpapers/wallpaper



