#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

acpi="$(acpi -t | grep "Thermal 0")"
temp=$(echo "$acpi" | cut -f4 -d\ | cut -f1 -d.)

if [ ${temp} -lt 45 ]; then
	color=$CGREEN
elif [ ${temp} -lt 60 ]; then
	color=$CYELLOW
else
	color=$CRED
fi

levels=""
if [ $temp -lt 40 ]; then
	picto=
elif [ $temp -lt 45 ]; then
	picto=
elif [ $temp -lt 50 ]; then
	picto=
elif [ $temp -lt 60 ]; then
	picto=
else
	picto=
fi

printf "$color$picto$temp°C "
