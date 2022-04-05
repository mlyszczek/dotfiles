#!/bin/sh

HOME="/home/lm-/"
sname=$(basename $(echo $TMUX | cut -f1 -d','))

tmux -L${sname} rename-window "humax1"
tmux -L${sname} send-keys "screen /dev/humax1 115200" C-m

tmux -L${sname} new-window -t ${session}:2 -n "humax2"
tmux -L${sname} send-keys "screen /dev/humax2 115200" C-m

tmux -L${sname} new-window -t ${session}:3 -n "arris"
tmux -L${sname} send-keys "screen /dev/arris 115200" C-m

tmux -L${sname} new-window -t ${session}:4 -n "apollo"
tmux -L${sname} send-keys "screen /dev/apollo 115200" C-m

tmux -L${sname} new-window -t ${session}:5 -n "selene"
tmux -L${sname} send-keys "screen /dev/selene 115200" C-m
