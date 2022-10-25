#!/bin/bash

for f in ~/.tmux/status-$1-$2.d/*; do
	$f 2>/dev/null
done
