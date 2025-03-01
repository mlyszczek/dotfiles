#!/usr/bin/env bash

i=0
for arg in $@; do
	if [ $arg = "static" ]; then continue; fi
	if [ $arg = "struct" ]; then continue; fi
	if [ $arg = '*' ]; then continue; fi

	i=$((i+1))
	if [ $i -eq 1 ]; then rettype=$(echo $arg); fi
	if [ $i -eq 2 ]; then fname=$(echo $arg | cut -f1 -d\(); fi
done

args=$(echo $@ | cut -f2 -d\( | cut -f1 -d\))

IFS=','
echo -e '/** ========================================================================='
echo ' * @brief '
if [ "$args" != "void" ]; then
	echo ' *'
	for arg in $args; do
		aname=$(echo $arg | rev | cut -f1 -d\ | rev | tr -d '*' | xargs echo)
		echo " * @param $aname "
	done
fi

if [ "$rettype" != void ]; then
	echo ' *'
	echo ' * @return 0 on success, otherwise -1 is returned'
fi
echo ' * =========================================================================='
figlet -w78 -c -ffuture "$fname" | sed 's/^/ */g'
echo -n ' * ========================================================================== */'
