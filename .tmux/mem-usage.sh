#!/usr/bin/env sh

picto_zfs=💽
picto_ram=💻

zfs=$(cat /proc/spl/kstat/zfs/arcstats | grep "^size " | awk '{print $3}')
ram=$(ps -e -orss=,args= | sort -b -k1,1n | cut -f1 -d\  | grep "^[0-9]" |
	awk '{s+=$1} END {print s * 1024}')

zfs=$(numfmt --to=iec-i --suffix=B --format="%8.2f" $zfs)
ram=$(numfmt --to=iec-i --suffix=B --format="%8.2f" $ram)

printf "*** $picto_zfs$zfs $picto_ram$ram"
