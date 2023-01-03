#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa
picto="📧"
MAIL="/home/lm-/.maildir"

unread_list=$(find $MAIL/gov/new $MAIL/private/new $MAIL/bofc/new $MAIL/conclusive/new -type f)
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

if value_increased unread-mail ${unread_total}; then
	o=$(mktemp)
	for m in $unread_list; do
		cat $m | formail -x from -x subject | tail -n +2 |
			perl -MEncode=from_to -pe 'from_to $_, "MIME-Header", "utf8"' >> $o
	done
	if [ -s $o ]; then
		cat $o | notify_phone
	fi
	rm -f $o
fi
