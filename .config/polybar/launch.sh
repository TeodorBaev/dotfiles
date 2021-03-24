#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Import colors from .Xresources 
i=0
while (( $i < 15 )) ;
do
	c=$(cat ~/.Xresources | grep -F "*.color"$i: | awk '{print $2}')
	v=COLOR_ENV_$i
	let i++
	export $v=$c
done

export COLOR_ENV_BG=$(cat ~/.Xresources | grep -F "*.background": | awk '{print $2}')
export COLOR_ENV_FG=$(cat ~/.Xresources | grep -F "*.foreground": | awk '{print $2}')

# Get DPI from .Xresources
export MONITOR_DPI=$(cat ~/.Xresources | grep -F "Xft.dpi" | awk '{print $2}')


# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

