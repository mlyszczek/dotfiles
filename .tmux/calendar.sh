#!/bin/sh

if [ $(hostname) != "marchewa" ]; then
	printf ""
	exit 0
fi

if [ "x${UNICODE_FONT}" = "x1" ]; then
	icon="📅"
else
	icon="next meeting "
fi

next=$(calcurse -nq | tail -n1 | xargs echo)
next_text=$(echo $next | cut -f2 -d] | xargs echo)
next_time=$(calcurse --filter-type cal -Q --days 2 | grep -B1 "$next_text" |
		head -n1 | sed 's/ - //')

if [ -z "${next}" ]; then
	printf "#[fg=green]${icon}#[fg=default](none)"
	exit 0
fi

printf "#[fg=red]${icon}#[fg=default](${next_time} ${next})"
