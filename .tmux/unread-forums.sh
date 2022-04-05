#!/bin/sh

. ${HOME}/.tmux/utils.sh

if [ $(hostname) != marchewa ]; then
	printf ""
	exit 0
fi

MAIL="/home/lm-/.maildir"

unread_list=$(find $MAIL/forum -type f | grep /new/)
if [ -z "$unread_list" ]; then
	unread_total=0
else
	unread_total=$(echo "$unread_list" | wc -l)
fi

if [ "x${UNICODE_FONT}" = "x1" ]; then
	picto="📰"
else
	picto="mail"
fi

if [ ${unread_total} -eq 0 ]; then
	printf "#[fg=green]${picto}"
else
	printf "#[fg=red]${picto}"
fi
