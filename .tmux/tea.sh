#!/usr/bin/env sh

tea -T
printf "[%s]" "$(cat /tmp/tmux-mqtt-cache/tea-status-cache)"
printf " *** "
