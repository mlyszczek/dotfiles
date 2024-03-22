#!/usr/bin/env sh

rettype=$(echo $1 | cut -f1 -d\ )
fname=$(echo $1 | cut -f2 -d\ | cut -f1 -d\()
args=$(echo $1 | cut -f2 -d\( | cut -f1 -d\))

echo '/* =========================================================================='
figlet -w78 -c -ffuture "$(echo $fname | tr '_' ' ')"
echo '   =========================================================================='
echo "   ========================================================================== */"
echo $rettype $fname
echo '('

IFS=','
maxtype=0
maxname=0
for arg in $args; do
	atype=$(echo $arg | rev | cut -f2- -d\ | rev | xargs echo)
	aname=$(echo $arg | rev | cut -f1 -d\ | rev | xargs echo)
	
	if test ${#atype} -gt $maxtype; then maxtype=${#atype}; fi
	if test ${#aname} -gt $maxname; then maxname=${#aname}; fi
done

maxtype=$((maxtype + 2))
maxname=$((maxname + 2))

for arg in $args; do
	atype=$(echo $arg | rev | cut -f2- -d\ | rev | xargs echo)
	aname=$(echo $arg | rev | cut -f1 -d\ | rev | xargs echo)

	printf "\t%-*s%-*s /* */\n" $maxtype "$atype" $maxname "$aname,"
done



echo ')'
echo '{'
echo
echo '}'
