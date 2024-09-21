#!/bin/zsh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

power=$(cat /tmp/tmux-mqtt-cache/rack-power-usage)
gar_power=$(cat /tmp/tmux-mqtt-cache/garage-ups-power)
picto=💻⚡
printf "*** $picto%sW + %sW " "$power" "$gar_power"
