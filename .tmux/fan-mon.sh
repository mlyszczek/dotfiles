#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

fan_path=/sys/devices/platform/thinkpad_hwmon/hwmon/hwmon*/fan1_input

if [ ! -f $fan_path ]; then
	printf ""
	exit 0
fi

speed=$(cat $fan_path)
picto=
if [ $speed -eq 0 ]; then
	picto=ﴛ
fi

printf "$color$picto$speed\n"
