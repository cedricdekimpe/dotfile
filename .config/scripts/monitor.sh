#!/bin/bash


xrandr --output eDP1 --primary --mode 3200x1800 --scale 0.6x0.6
# xrandr --output DP1 --mode 2560x1080 --scale 1x1 # AppTweak LG
# xrandr --output DP1 --mode 1920x1080 --scale 1x1 # Home


exit

intern=eDP1
extern=DP1
# extern=DP3
internalSettings="xrandr --output $intern --primary --mode 3840x2160 --scale 0.6x0.6"

screenIDRegex="[[:alpha:]]{2}[[:digit:]]{1}"
screenResolutionRegex="[[:digit:]]{3,4}x[[:digit:]]{3,4}"
connectedScreensRegex="$screenIDRegex connected $screenResolutionRegex"

connectedScreenID=$(xrandr | egrep "${connectedScreensRegex}" -o | egrep "${screenIDRegex}" -o)
connectedScreenResolution=$(xrandr | egrep "${connectedScreensRegex}" -o | egrep "${screenResolutionRegex}" -o)

echo $connectedScreenID
echo $connectedScreenResolution

xrandr --output $connectedScreenID --scale 1x1 --mode $connectedScreenResolution





exit

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
  # $internalSettings --fb 5760x2160
  $internalSettings --fb 7680x2160 --pos 3840x0
  xrandr --output $extern --scale 1x1 --mode 1920x1080
  # xrandr --output $extern --scale 1x1 --mode 2560x1080 # AppTweak LG
  echo "-> Desktop Mode 1920x1080"

fi
