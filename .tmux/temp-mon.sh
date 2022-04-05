#!/bin/sh

if [ $(hostname) != "marchewa" ]; then
	printf ""
	exit 0
fi

if ! type acpi >/dev/null 2>&1; then
	printf ""
	exit 0
fi

acpi="$(acpi -t | grep "Thermal 0")"
temp=$(echo "$acpi" | cut -f4 -d\ | cut -f1 -d.)

if [ ${temp} -lt 45 ]; then
	color="#[fg=green]"
elif [ ${temp} -lt 60 ]; then
	color="#[fg=yellow]"
else
	color="#[fg=red]"
fi

if [ "x${UNICODE_FONT}" = "x1" ]; then
	levels=""
	if [ $temp -lt 40 ]; then
		icon=
	elif [ $temp -lt 45 ]; then
		icon=
	elif [ $temp -lt 50 ]; then
		icon=
	elif [ $temp -lt 60 ]; then
		icon=
	else
		icon=
	fi

	printf "$color$icon$temp°C\n"
else
	printf "${color}%s*C" "$temp"
fi
