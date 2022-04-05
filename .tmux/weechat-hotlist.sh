#!/bin/sh

. ${HOME}/.tmux/utils.sh

if [ $(hostname) != marchewa ]; then
	printf ""
	exit 0
fi

count=0
if [ -r /tmp/hotlist-udp-current ]; then
	count=$(cat /tmp/hotlist-udp-current)
fi

if [ "x${UNICODE_FONT}" = "x1" ]; then
	picto="📟"
else
	picto="irc"
fi

if [ -z "${count}" ] || ! [ ${count} -eq ${count} ] || [ ${count} -eq 0 ]; then
	printf "#[fg=green]${picto}"
else
	printf "#[fg=red]${picto}"
fi

if value_changed unread-weechat ${count}; then
	if [ ${count} -gt 0 ]; then
		echo "unread pm: ${count}" | notify_phone
	fi
fi
