#!/bin/sh

HOME="/home/lm-"

cd ${HOME}

kitty --start-as=fullscreen tmux new -s master &
sleep 1
# tmux new-window -t master:1 -n "misc" <- already created by default
	tmux send-keys "tcn readers" C-m
	sleep 0.5
			tmux send-keys "mutt" C-m
		tmux -L readers new-window -t readers:2 -n "asp"
			tmux send-keys "mutt-aspi.net.pl" C-m
		tmux -L readers new-window -t readers:3 -n "rss"
			tmux send-keys "mutt-rss" C-m
		tmux -L readers new-window -t readers:4 -n "reddit"
			tmux send-keys "tuir" C-m
		tmux -L readers new-window -t readers:5 -n "calcurse"
			tmux send-keys "calcurse" C-m
		tmux -L readers select-window -t readers:1

	tmux splitw -h
	tmux send-keys "ssh colon -t tmux attach -t 0" C-m
	tmux splitw -v
	tmux send-keys "ncmpcpp --host kurwik" C-m

tmux new-window -t master:2 -n "root"

tmux new-window -t master:3 -n "bofc"
	tmux send-keys "tcn bofc" C-m

tmux new-window -t master:4 -n "red"
	tmux send-keys "tcn red" C-m
	sleep 0.5
		tmux send-keys "/usr/lgi/bin/jira-lgi --extra-info"
		tmux -L red splitw -h -t red:1
		tmux send-keys "cd ~/projekty/lgi/scripts" C-m
		tmux -L red splitw -v -t red:1
		tmux send-keys "cd ~/www/deploy" C-m

		tmux -L red select-pane -T jira -t red:1.0
		tmux -L red select-pane -T lgi-scripts -t red:1.1
		tmux -L red select-pane -T lgi-images -t red:1.2


		tmux -L red new-window -t red:2 -n "serials"
		tmux send-keys "/usr/lgi/bin/open-serial.sh eos1008c"
		tmux -L red splitw -h -t red:2
		tmux send-keys "/usr/lgi/bin/open-serial.sh eos2008c"
		tmux -L red splitw -v -t red:2
		tmux send-keys "/usr/lgi/bin/open-serial.sh dcx960"
		tmux -L red select-pane -tred:2.0
		tmux -L red splitw -v -t red:2
		tmux send-keys "/usr/lgi/bin/open-serial.sh apollo"

		tmux -L red select-pane -T eos1008c -t red:2.0
		tmux -L red select-pane -T apollo -t red:2.1
		tmux -L red select-pane -T eos2008c -t red:2.2
		tmux -L red select-pane -T dcx960 -t red:2.3

		tmux -L red new-window -t red:3 -n "nasc"
		tmux send-keys "cd ~/projekty/lgi/nasc-spreadsheet-suite/data-gathering-suite" C-m
		tmux -L red splitw -h -t red:3
		tmux -L red splitv -h -t red:3

		tmux -L red new-window -t red:4 -n "kurwik-builder"
		tmux send-keys "TERM=xterm ssh lgilab -t tmux attach -t 0" C-m

tmux new-window -t master:5 -n "rack"
	tmux send-keys "ssh kurwik -t tmux attach -t kurwik" C-m
	tmux splitw -h
	tmux send-keys "ssh root@detrytus -t tmux -u attach -t detrytus" C-m

tmux new-window -t master:6 -n "gertty"
	tmux send-keys "gertty" C-m

tmux new-window -t master:7 -n "redbuilder"
	tmux send-keys "ssh red-builder -t /home/michal.lyszczek/.init" C-m

tmux new-window -t master:10 -n "taskwarrior"
	tmux send-keys "tmux-task -i" C-m
