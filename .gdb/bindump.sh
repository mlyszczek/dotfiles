#!/usr/bin/env sh

addr=$(echo "print($1)" | python)
dump=$2
out=/dev/stdout
tmp=$(mktemp)
color=-c

if [ "$3" ]; then
	color=
	out=$3
fi

xxd_bin=$(xxd -o $addr -b -c 4 -g 1 $dump)
xxd_hex=$(xxd -o $addr -c 4 -g 1 $dump)

le() {
	awk '{ print $5 $4 $3 $2 }'
}

color_zeroes() {
	if [ -z "$color" ]; then
		cat -
		return
	fi

	if [ $1 = 4 ]; then
		sed "s/0000/$(tput setaf 4)0000$(tput sgr0)/g"
	else
		sed "s/00/$(tput setaf 4)00$(tput sgr0)/g"
	fi
}

echo "$xxd_bin" | awk '{ print $1 }'       > $tmp.adr
echo "$xxd_bin" | le | sed 's/.\{4\}/& /g' | color_zeroes 4 > $tmp.bin
echo "$xxd_hex" | le | sed 's/.\{2\}/& /g' | color_zeroes 2 > $tmp.hex
echo "$xxd_bin" | cut -f 7- -d' ' | rev > $tmp.str

echo "     addr:   28   24   20   16   12    8    4    0   3  2  1  0   str" >>$out
echo " --------  ---- ---- ---- ---- ---- ---- ---- ----  -- -- -- --  ----" >>$out
paste $tmp* | tr '\t' ' ' >>$out
rm $tmp*
