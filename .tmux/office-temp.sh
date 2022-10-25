#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

temp=$(cat /tmp/tmux-mqtt-cache/office-temp)
picto=🏢
printf "$picto$temp°C *** "
