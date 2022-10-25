#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa
picto="📝"

t=$(task rc.verbose: limit:1 murg +OVERDUE)
if [ "$t" ]; then
	printf "$CRED$picto[!!]$t$CRESET ***"
	exit 0
fi

t=$(task rc.verbose: limit:1 murg)
time_u=$(echo $t | cut -f1 -d\ | grep -Eo "[a-z]" | head -n1)

if [ x$time_u == xh ]; then
	printf "$CRED"
else
	printf "$CGREEN"
fi

if [ x$time_u != xh -a x$time_u != xd ]; then
	# no time specified, add dash at first location
	# to not break up where [] are being put
	# without, [] will be put on first work like
	# [kupić] inwerter, instead of [-] kupić inwerter
	t="- $t"
fi


printf "$picto[%s ***" "$(echo $t | sed -e 's/ /]/')"
