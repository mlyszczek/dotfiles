#!/bin/sh

if [ $(hostname) != "marchewa" ]; then
	printf ""
	exit 0
fi

t_left="/apc/estimated-runtime"
t_on_bat="/apc/status/on-battery"
t_bat_volt="/apc/battery/voltage"
t_bat_charge="/apc/battery/charge"
mqtt_host=kurwik

bat_charge=$(mosquitto_sub -C 1 -h $mqtt_host -F '%p' -t "$t_bat_charge")
bat_charge=$(echo "$bat_charge / 1" | bc)
if [ $bat_charge = 100 ]; then
	printf "ok"
	exit 0
fi

on_bat=$(mosquitto_sub -C 1 -h $mqtt_host -F '%p' -t "$t_on_bat")
left=$(mosquitto_sub -C 1 -h $mqtt_host -F '%p' -t "$t_left")
bat_volt=$(mosquitto_sub -C 1 -h $mqtt_host -F '%p' -t "$t_bat_volt")

levels=""
l=$((bat_charge / 10))
level="${levels:$l:1}"

if [ $on_bat = 0 ]; then
	charge=🔌
fi

stopwatch=⏳️
#left=$(printf "%dmin" "$left")
left=$(echo "$left / 1" | sed 's/://' | bc)min
printf "ups: $charge$level$bat_charge%%($stopwatch$left) $bat_volt[V]"
