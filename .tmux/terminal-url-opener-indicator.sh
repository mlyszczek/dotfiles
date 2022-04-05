#!/bin/sh

if [ $(hostname) != marchewa ]; then
	printf ""
	exit 0
fi

if [ "x${UNICODE_FONT}" = "x1" ]; then
	picto="🔗"
else
	picto="link"
fi

if [ -e /tmp/terminal-url-opener-working ]; then
	printf "#[fg=red]${picto}"
else
	printf "#[fg=green]${picto}"
fi
