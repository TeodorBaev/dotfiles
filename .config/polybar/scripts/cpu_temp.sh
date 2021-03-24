#!/bin/bash

color="$COLOR_ENV_FG"

temp=$(sensors | grep -m 1 'Core 0:' | awk '{print substr($3, 2)-4}')

if [ $temp -gt 70 ]; then
	color="$COLOR_ENV_1"
fi
echo "%{F$COLOR_ENV_14}TEMP %{F-}%{F$color}$temp°C%{F-}"
