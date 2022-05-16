#!/bin/sh

if [ $(hostname) != "marchewa" ]; then
	printf ""
	exit 0
fi

temp=$(cat /tmp/tmux-mqtt-cache/office-temp)
icon=🏢
printf "$icon$temp°C\n"
