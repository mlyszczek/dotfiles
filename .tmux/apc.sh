#!/bin/sh

if [ $(hostname) != "marchewa" ]; then
	printf ""
	exit 0
fi

left="$(cat /tmp/tmux-mqtt-cache/ups-estimated-runtime)"
on_bat="$(cat /tmp/tmux-mqtt-cache/ups-on-battery)"
bat_volt="$(cat /tmp/tmux-mqtt-cache/ups-voltage)"
bat_charge="$(cat /tmp/tmux-mqtt-cache/ups-charge)"

bat_charge=$(echo "$bat_charge / 1" | bc)

levels=""
l=$((bat_charge / 10))
level="${levels:$l:1}"

if [ $on_bat = 0 ]; then
	charge=🔌
fi

stopwatch=⏳️
#left=$(printf "%dmin" "$left")
left=$(echo "$left / 1" | sed 's/://' | bc)min
printf "🔋 $charge$level$bat_charge%%($stopwatch$left) $bat_volt[V]"
