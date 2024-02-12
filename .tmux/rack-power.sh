#!/bin/zsh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

power=$(cat /tmp/tmux-mqtt-cache/rack-power-usage)
picto=💻⚡
printf "*** $picto%sW " "$power"
