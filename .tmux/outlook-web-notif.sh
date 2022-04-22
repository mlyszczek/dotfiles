#!/bin/sh

. ${HOME}/.tmux/utils.sh

if [ $(hostname) != marchewa ]; then
	printf ""
	exit 0
fi


# run once each 15 seconds to not hog cpu too much
last_count_file=/tmp/outlook-notif-last-count
if has_time_passed outlook-notif-last-run 15; then
	count=$(cat /tmp/google-chrome-xwininfo | grep "MS Outlook - " |
			cut -f2 -d\( | cut -f1 -d\) |
			grep -Po '[0-9]+' | tr -d '\n')
	echo $count > $last_count_file
else
	count=$(cat $last_count_file)
fi

count=$(echo $count | bc)

if [ "x${UNICODE_FONT}" = "x1" ]; then
	picto="📫"
else
	picto="outlook"
fi

if [ -z "${count}" ] || ! [ ${count} -eq ${count} ] || [ ${count} -eq 0 ]; then
	printf "#[fg=green]${picto}"
else
	printf "#[fg=red]${picto}"
fi

if value_increased unread-outlook ${count}; then
	if [ ${count} -gt 0 ]; then
		echo "unread outlook: ${count}" | notify_phone
	fi
fi
