#!/bin/sh

left=$(alarm --show)
if [ $? -eq 0 ]; then
	count=$left
fi

if [ "x${UNICODE_FONT}" = "x1" ]; then
	picto="⏰"
else
	picto="alarm"
fi

if [ -z "${count}" ]; then
	printf "#[fg=green]${picto}"
else
	printf "#[fg=red]${picto}(${count})"
fi
