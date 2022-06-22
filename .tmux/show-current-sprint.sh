#!/usr/bin/env sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

while read line; do
	start_epoch=$(date -d "$(echo "$line" | cut -f1) 00:00:01" +%s)
	finish_epoch=$(date -d "$(echo "$line" | cut -f2) 00:00:00" +%s)
	sr=$(echo "$line" | cut -f3)
	now=$(date +%s)

	if [ $start_epoch -lt $now -a $now -lt $finish_epoch ]; then
		left=$((finish_epoch - now))
		strleft=$(date -u -d@$left +"%ed %H:%M:%S")
		echo "$sr ($strleft)"
		exit 0
	fi
done < <(cat ~/.calcurse/lgi-sr-apts)
