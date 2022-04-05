#!/bin/sh

field()
{
	echo "$1" | awk -v f="$2" '{print $f}'
}

usage()
{
	printf "$2%s/%s(%s%s)" $(field "$1" 3) $(field "$1" 2) $(field "$1" 5)
}

f="$(df -h | grep -P "/$|/home$|/var/backup$")"

r="$(echo "$f" | grep "/$")"
h="$(echo "$f" | grep "/home$")"
b="$(echo "$f" | grep "/var/backup$")"

# in case home and/or backup is not mounted
# then it means it's on rootfs
if [ -z "$h" ]; then h=$r; fi
if [ -z "$b" ]; then b=$r; fi

case $(uname) in
	OpenBSD) os= ;;
	*) is= ;;
esac

usage "$r" ""
usage "$h" " "
usage "$b" " "
