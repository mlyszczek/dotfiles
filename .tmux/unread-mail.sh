#!/bin/sh

. ${HOME}/.tmux/utils.sh

if [ $(hostname) != marchewa ]; then
	printf ""
	exit 0
fi

MAIL="/home/lm-/.maildir"

gov_unread=$(ls -1 "$MAIL/gov/new" | wc -l)
private_unread=$(ls -1 "${MAIL}/private/new" | wc -l)
bofc_unread=$(ls -1 "${MAIL}/bofc/new" | wc -l)
#mailing_lists_unread=$(find "${MAIL}/mailing-lists" -name new -exec ls -1 {} \; | wc -l)
red_unread=$(ls -1 "${MAIL}/red-embedded/new" | wc -l)
#red_lgi_unread=$(find "${MAIL}/red-embedded/lgi" -name new -exec ls -1 {} \; | wc -l)
soltech_unread=$(ls -1 "${MAIL}/soltech/new" | wc -l)

unread_list=$(find $MAIL/gov/new $MAIL/private/new $MAIL/bofc/new $MAIL/red-embedded/new -type f)
if [ -z "$unread_list" ]; then
	unread_total=0
else
	unread_total=$(echo "$unread_list" | wc -l)
fi

if [ "x${UNICODE_FONT}" = "x1" ]; then
	picto="📧"
else
	picto="mail"
fi

if [ ${unread_total} -eq 0 ]; then
	printf "#[fg=green]${picto}"
else
	printf "#[fg=red]${picto}"
fi

if value_increased unread-mail ${unread_total}; then
	o=$(mktemp)
	for m in $unread_list; do
		cat $m | formail -x from -x subject | tail -n +2 |
			perl -MEncode=from_to -pe 'from_to $_, "MIME-Header", "utf8"' >> $o
		#printf "\n" >> $o
	done
	if [ -s $o ]; then
		cat $o | notify_phone
	fi
	rm -f $o

#	if [ ${unread_total} -gt 0 ]; then
#		echo "unread mail: ${unread_total}" | notify_phone
#	fi
fi
