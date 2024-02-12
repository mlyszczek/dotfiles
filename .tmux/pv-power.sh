#!/bin/zsh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

power=$(cat /tmp/tmux-mqtt-cache/pv-power)
v1=$(cat /tmp/tmux-mqtt-cache/pv-volt1)
v2=$(cat /tmp/tmux-mqtt-cache/pv-volt2)
v3=$(cat /tmp/tmux-mqtt-cache/pv-volt3)
if [ $((v1 > v2)) = 1 ]; then max=$v1; else max=$v2; fi
if [ $((v3 > max)) = 1 ]; then max=$v3; fi

picto=⚡
printf "*** $picto%sW %sV " "$power" "$max"
