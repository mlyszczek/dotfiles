#!/bin/sh

cat /proc/cpuinfo | grep "cpu MHz" | head -n1 | awk '{print $4}' | cut -f1 -d.
