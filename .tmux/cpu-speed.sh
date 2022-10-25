#!/bin/sh

grep "cpu MHz" /proc/cpuinfo | awk -vncpu=$(nproc) \
	'{s+=$4} END {printf " " s/ncpu "MHz *** "}'
