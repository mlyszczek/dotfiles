#!/bin/sh

if [ $(hostname) != "marchewa" ]; then
	printf ""
	exit 0
fi

temp_topic="/ac/office/temp"
mqtt_host=kurwik

temp=$(mosquitto_sub -C 1 -h $mqtt_host -F '%p' -t "$temp_topic")

icon=🏢
printf "$icon$temp°C\n"
