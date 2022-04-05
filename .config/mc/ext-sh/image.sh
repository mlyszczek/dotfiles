#!/bin/sh

# $1 - action
# $2 - type of file

action=$1
filetype=$2

case "${action}" in
view)
	sxiv "${MC_EXT_FILENAME}" #>/dev/null 2>&1 &
    ;;
open)
	sxiv "${MC_EXT_FILENAME}" >/dev/null 2>&1 &
	;;
*)
	echo "error, action ${action} not defined for video"
    ;;
esac
