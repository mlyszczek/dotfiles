#!/bin/sh

# $1 - action
# $2 - type of file

action=$1
filetype=$2

echo cipeczki

case "${action}" in
view|open)
	mpv "${MC_EXT_FILENAME}" >/dev/null 2>&1 &
    ;;
*)
	echo "error, action ${action} not defined for video"
    ;;
esac
