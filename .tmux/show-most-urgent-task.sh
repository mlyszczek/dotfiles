#!/bin/sh

. ${HOME}/.tmux/utils.sh

if [ $(hostname) != marchewa ]; then
	printf ""
	exit 0
fi

if [ "x${UNICODE_FONT}" = "x1" ]; then
	picto="📝"
else
	picto="task"
fi


t=$(task rc.verbose: limit:1 murg +OVERDUE)
if [ "$t" ]; then
	printf "#[fg=red]$picto[!!]$t"
	exit 0
fi

t=$(task rc.verbose: limit:1 murg)
time_u=$(echo $t | cut -f1 -d\ | grep -Eo "[a-z]" | head -n1)

if [ x$time_u == xh ]; then
	printf "#[fg=red]"
else
	printf "#[fg=green]"
fi

if [ x$time_u != xh -a x$time_u != xd ]; then
	# no time specified, add dash at first location
	# to not break up where [] are being put
	# without, [] will be put on first work like
	# [kupić] inwerter, instead of [-] kupić inwerter
	t="- $t"
fi


printf "$picto[%s" "$(echo $t | sed -e 's/ /]/')"
