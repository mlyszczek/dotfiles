#!/bin/sh

if [ $(hostname) != marchewa ]; then
	printf ""
	exit 0
fi

if ! type mpc >/dev/null 2>&1; then
	exit 0
fi

m="$(mpc -h kurwik)"

track=$(echo "${m}" | sed -n 1p)
info=$(echo "${m}" | sed -n 2p)
volume=$(pactl get-sink-volume $(pactl get-default-sink) |
	grep -Po "[0-9]?[0-9]{2}%" | head -n1 | tr -d '%')
volume=$((volume))

levels=" ▁▂▃▄▅▆▇█"
l=$((volume / (100/9)))
level="${levels:$l:1}"
if [ $volume -eq 0 ]; then
	icon_volume=ﱝ
elif [ $volume -gt 0 ]; then
	icon_volume=
elif [ $volume -gt 50 ]; then
	icon_volume=
fi


if [ -z "${info}" ]
then icon="◼"
    echo "[${icon}] :: ${volume}"
    exit 0
fi

if echo "${info}" | grep playing > /dev/null
then
    icon="▶"
else
    icon=""
fi

echo "$icon_volume$volume [${icon}]🎵${track}🎵"
