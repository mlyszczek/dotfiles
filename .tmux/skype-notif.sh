#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa

# run once each 15 seconds to not hog cpu too much
#last_count_file=/tmp/skype-notif-last-count
#if  has_time_passed skype-notif-last-run 15; then
count=$(cat /tmp/google-chrome-xwininfo | grep "Skype -" | \
		cut -f2 -d\" | cut -f1 -d\" |
		grep -Po '[0-9]+' | tr -d '\n')
#	echo $count > $last_count_file
#else
#	count=$(cat $last_count_file)
#fi

picto="💬"

if [ -z "${count}" ] || ! [ ${count} -eq ${count} ] || [ ${count} -eq 0 ]; then
	printf "#[fg=green]${picto}"
else
	printf "#[fg=red]${picto}"
fi

if value_increased unread-skype ${count}; then
	if [ ${count} -gt 0 ]; then
		echo "unread skype: ${count}" | notify_phone
	fi
fi
