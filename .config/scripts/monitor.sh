#!/bin/bash
intern=eDP-1
extern=DP-2
internalSettings="xrandr --output $intern --primary --mode 3840x2160 --scale 1x1"

if xrandr | grep "$extern disconnected"; then
  $internalSettings --output $extern --off
  echo "-> Laptop Mode"

# elif xrandr | grep "$extern connected 4160x2640+0+0"; then
#   $internalSettings --fb 4160x2640
#   xrandr --output $extern --scale 2x2 --mode 3840x2160 
#   echo "-> Desktop Mode - Asus 4K"

# elif xrandr | grep "$extern connected 3840x2160+0+0"; then
#   # $internalSettings --fb 3840x2160
#   $internalSettings --fb 5760x2160
#   xrandr --output $extern --scale 2x2 --mode 1920x1080 #--left-of $intern
#   echo "-> Desktop Mode - Samsung 1920x1080"

else
  $internalSettings --fb 5760x2160
  xrandr --output $extern --scale 2x2 --mode 1920x1080 --right-of $intern
  echo "-> Desktop Mode 1920x1080"

fi
