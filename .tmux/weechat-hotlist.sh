#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa
picto="📟"

count=0
if [ -r /tmp/hotlist-udp-current ]; then
	count=$(cat /tmp/hotlist-udp-current)
fi

if [ -z "${count}" ] || ! [ ${count} -eq ${count} ] || [ ${count} -eq 0 ]; then
	printf "$CGREEN${picto}"
else
	printf "$CRED${picto}"
fi

# weechat2jabber on kurwik deals with message sending now
#if value_changed unread-weechat ${count}; then
#	if [ ${count} -gt 0 ]; then
#		echo "unread pm: ${count}" | notify_phone
#	fi
#fi
