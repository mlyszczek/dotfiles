#!/bin/sh

if [ $(hostname) != "marchewa" ]; then
	printf ""
	exit 0
fi

fan_path=/sys/devices/platform/thinkpad_hwmon/hwmon/hwmon*/fan1_input

if [ ! -f $fan_path ]; then
	printf ""
	exit 0
fi

speed=$(cat $fan_path)
icon=
if [ $speed -eq 0 ]; then
	icon=ﴛ
fi

if [ "x${UNICODE_FONT}" = "x1" ]; then
	printf "$color$icon$speed\n"
else
	printf "${color}%s" "$speed"
fi
