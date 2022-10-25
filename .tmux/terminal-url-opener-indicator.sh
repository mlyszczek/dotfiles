#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa
picto="🔗"

if [ -e /tmp/terminal-url-opener-working ]; then
	printf "$CRED${picto}"
else
	printf "$CGREEN${picto}"
fi
