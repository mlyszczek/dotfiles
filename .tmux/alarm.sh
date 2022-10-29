#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa
picto="⏰"

left=$(alarm --show)
if [ $? -eq 0 ]; then
	count=$left
fi

if [ -z "${count}" ]; then
	printf "$CGREEN$picto$CRESET * "
else
	printf "$CRED$picto($count)$CRESET * "
fi
