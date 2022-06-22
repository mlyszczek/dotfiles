#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa
picto="⏰"

left=$(alarm --show)
if [ $? -eq 0 ]; then
	count=$left
fi

if [ -z "${count}" ]; then
	printf "#[fg=green]${picto}"
else
	printf "#[fg=red]${picto}(${count})"
fi
