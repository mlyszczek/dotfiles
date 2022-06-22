#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

if ! type acpi >/dev/null 2>&1; then
	exit 0
fi

acpi="$(acpi -b | grep -v "unavailable" | head -n1)"
msg="$(echo "${acpi}" |  cut -f3- -d' ')"
percent="$(echo "${acpi}" | cut -f4 -d' ' | cut -f1 -d%)"
left="(⏳️$(echo "${acpi}" | grep -Po "\d{2}:\d{2}:\d{2}"))"

if [ ${percent} -gt 80 ]; then
	color="#[fg=green]"
elif [ ${percent} -gt 30 ]; then
	color="#[fg=yellow]"
else
	color="#[fg=red]"
fi

levels=""
connected=""
if echo "${msg}" | grep -P "Full|Charging" >/dev/null; then
	connected="🔌"
	if [ ${percent} -gt 90 ]; then
		left=
	fi
fi

l=$((percent / 10))
echo $l > /tmp/asdf
level="${levels:$l:1}"
printf "${color}${connected}${level}${percent}%%${left}\n"
