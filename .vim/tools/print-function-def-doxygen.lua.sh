#!/usr/bin/env sh

src=$(echo $1 | cut -f1 -d\ )
fname=$(echo $1 | cut -f3 -d\ | cut -f1 -d\()
args=$(echo $1 | cut -f2 -d\( | cut -f1 -d\))

IFS=','
echo '--! ============================================================================'
echo '--! @brief '
if [ "$args" ]; then
	echo '--!'
	for arg in $args; do
		aname=$(echo $arg | rev | cut -f1 -d\ | rev | tr -d '*' | xargs echo)
		echo "--! @param $aname "
	done
fi

echo '--! ============================================================================'
figlet -w78 -c -ffuture "$fname" | sed 's/^/--!/g'
echo '--! ============================================================================'

if [ $src = line ]; then exit 0; fi

echo "function $fname($args)"
echo
echo 'end'
