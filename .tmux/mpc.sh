#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

m="$(mpc -h celyn)"

track=$(echo "${m}" | sed -n 1p)
info=$(echo "${m}" | sed -n 2p)
volume=$(pactl get-sink-volume $(pactl get-default-sink) |
	grep -Po "[0-9]?[0-9]{2}%" | head -n1 | tr -d '%')
volume=$((volume))

levels=" ▁▂▃▄▅▆▇█"
l=$((volume / (100/9)))
level="${levels:$l:1}"
if [ $volume -eq 0 ]; then
	picto_volume=ﱝ
elif [ $volume -gt 0 ]; then
	picto_volume=
elif [ $volume -gt 50 ]; then
	picto_volume=
fi


if [ -z "${info}" ]
then picto="◼"
    printf "*** $picto_volume$volume [$picto] *** "
    exit 0
fi

if echo "${info}" | grep playing > /dev/null
then
    picto="▶"
else
    picto=""
fi

printf "*** $picto_volume$volume [${picto}]🎵${track}🎵 *** "
