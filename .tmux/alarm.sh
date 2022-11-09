#!/bin/sh

. ${HOME}/.tmux/utils.sh
run_only_on_hostname marchewa
picto="⏰"

alarms=$(alarm --show)
if [ $? -ne 0 ]; then
	printf "$CGREEN$picto$CRESET * "
	exit 0
fi

# remove tea alarm - it has dedicated bar
alarms=$(echo "$alarms" | grep -v "tea")
# remove new lines to show alarms in one line
alarms=$(echo $alarms)

printf "$CRED$picto$alarms$CRESET * "
