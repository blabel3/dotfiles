#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=""

pgrep -x redshift &> /dev/null
if [[ $? -eq 0 ]]; then
    temp=$(redshift -p 2>/dev/null | grep temp | cut -d' ' -f3)
    temp=${temp//K/}
fi

# OPTIONAL: Append ' ${temp}K' after $icon
if [[ -z $temp ]]; then
    echo "%{F#707880}$icon"       # Greyed out (not running)
elif [[ $temp -ge 5000 ]]; then
    echo "%{F#82AAFF}$icon"       # Blue
elif [[ $temp -ge 4000 ]]; then
    echo "%{F#FFCC00}$icon"       # Yellow
else
    echo "%{F#EA9560}$icon"       # Orange
fi
