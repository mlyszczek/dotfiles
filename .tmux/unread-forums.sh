#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa
picto="📰"
MAIL="/home/lm-/.maildir"

unread_list=$(find $MAIL/forum -type f | grep /new/)
if [ -z "$unread_list" ]; then
	unread_total=0
else
	unread_total=$(echo "$unread_list" | wc -l)
fi
if [ ${unread_total} -eq 0 ]; then
	printf "$CGREEN${picto}"
else
	printf "$CRED${picto}"
fi
