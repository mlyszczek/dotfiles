#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

left="$(cat /tmp/tmux-mqtt-cache/ups-estimated-runtime)"
on_bat="$(cat /tmp/tmux-mqtt-cache/ups-on-battery)"
bat_volt="$(cat /tmp/tmux-mqtt-cache/ups-voltage)"
bat_charge="$(cat /tmp/tmux-mqtt-cache/ups-charge)"

gar_left="$(cat /tmp/tmux-mqtt-cache/garage-ups-estimated-runtime)"
gar_on_bat="$(cat /tmp/tmux-mqtt-cache/garage-ups-on-battery)"
gar_bat_volt="$(cat /tmp/tmux-mqtt-cache/garage-ups-voltage)"
gar_bat_charge="$(cat /tmp/tmux-mqtt-cache/garage-ups-charge)"

bat_charge=$(echo "$bat_charge / 1" | bc)
gar_bat_charge=$(echo "$gar_bat_charge / 1" | bc)

levels=""
l=$((bat_charge / 10))
level="${levels:$l:1}"
l=$((gar_bat_charge / 10))
gar_level="${levels:$l:1}"

if [ $on_bat = 0 ]; then
	charge=🔌
fi
if [ $gar_on_bat = 0 ]; then
	gar_charge=🔌
fi

stopwatch=⏳️
#left=$(printf "%dmin" "$left")
left=$(echo "$left / 1" | sed 's/://' | bc)min
gar_left=$(echo "$gar_left / 1" | sed 's/://' | bc)min
printf "*** 🔋 $charge$level$bat_charge%%($stopwatch$left) | "
printf "$gar_charge$gar_level$gar_bat_charge%%($stopwatch$gar_left) *** "
