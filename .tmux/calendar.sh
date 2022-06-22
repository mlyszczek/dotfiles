#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

picto="📅"

next=$(calcurse -nq | tail -n1 | xargs echo)
next_text=$(echo $next | cut -f2 -d] | xargs echo)
next_time=$(calcurse --filter-type cal -Q --days 2 | grep -B1 "$next_text" |
		head -n1 | sed 's/ - //')

if [ -z "${next}" ]; then
	printf "#[fg=green]${picto}#[fg=default](none)"
	exit 0
fi

printf "#[fg=red]${picto}#[fg=default](${next_time} ${next})"
