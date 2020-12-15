#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

configfile=~/.config/polybar/themes/nicomazz/config

# Launch bar1 and bar2
# polybar -c ~/.config/polybar/config.ini main &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c $configfile top &
    # MONITOR=$m polybar --reload -c $configfile bottom &
  done
else
  polybar --reload -c $configfile top &
  # polybar --reload -c $configfile bottom &
fi
