#!/bin/sh

HOME="/home/lm-"

cd ${HOME}

start_main()
{
kitty --start-as=fullscreen tmux new -s master &
sleep 1
}

start_readers()
{
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
}

start_root()
{
	tmux new-window -t master:2 -n "root"
}

start_bofc()
{
	tmux new-window -t master:3 -n "bofc"
		tmux send-keys "tcn bofc" C-m
}

start_red()
{
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

			tmux -L red select-pane -tred:2.0
			tmux -L red splitw -h -t red:2
			tmux -L red select-pane -tred:2.2
			tmux -L red splitw -h -t red:2
			tmux -L red select-pane -tred:2.4
			tmux -L red splitw -h -t red:2
			tmux -L red select-pane -tred:2.6
			tmux -L red splitw -h -t red:2

			tmux -L red select-pane -T ser-eos1008c -t red:2.0
			tmux -L red select-pane -T ser-apollo -t red:2.2
			tmux -L red select-pane -T ser-eos2008c -t red:2.4
			tmux -L red select-pane -T ser-dcx960 -t red:2.6
			tmux -L red select-pane -T ssh-eos1008c -t red:2.1
			tmux -L red select-pane -T ssh-apollo -t red:2.3
			tmux -L red select-pane -T ssh-eos2008c -t red:2.5
			tmux -L red select-pane -T ssh-dcx960 -t red:2.7

			tmux -L red new-window -t red:3 -n "nasc"
			tmux send-keys "cd ~/projekty/lgi/nasc-spreadsheet-suite/data-gathering-suite" C-m
			tmux -L red splitw -h -t red:3
			tmux -L red splitw -h -t red:3
}

start_rack()
{
	tmux new-window -t master:5 -n "rack"
		tmux send-keys "ssh kurwik -t tmux attach -t kurwik" C-m
		tmux splitw -h
		tmux send-keys "ssh root@detrytus -t tmux -u attach -t detrytus" C-m
}

start_gertty()
{
	tmux new-window -t master:6 -n "gertty"
		tmux send-keys "gertty" C-m
}

start_lgilab()
{
	tmux new-window -t master:7 -n "lgilab"
		tmux send-keys "ssh lgilab -t tmux attach -t lgilab" C-m
}

start_hex()
{
	tmux new-window -t master:8 -n "hex"
		tmux send-keys "ssh hex -t tmux attach -t hex" C-m
}

start_alti()
{
	tmux new-window -t master:9 -n "alti"
		tmux send-keys "tcn alti" C-m
}

start_taskwarrior()
{
	tmux new-window -t master:10 -n "taskwarrior"
		tmux send-keys "tmux-task -i" C-m
}

start_taskwarrior_todo()
{
	tmux new-window -t master:11 -n "taskwarrior"
		tmux send-keys "TMUX_TASK_ID=todo TASKRC=/home/lm-/.taskrc-kurwinet tmux-task -i" C-m
}


if [ x$1 = x ]; then
	start_main
	start_readers
	start_root
	start_bofc
	start_red
	start_rack
	start_gertty
	start_lgilab
	start_hex
	start_alti
	start_taskwarrior
	start_taskwarrior_todo
else
	eval start_$1
#	case $1 in
#		main)             start_main ;;
#		readers)          start_readers ;;
#		root)             start_root ;;
#		bofc)             start_bofc ;;
#		red)              start_red ;;
#		rack)             start_rack ;;
#		gertty)           start_gertty ;;
#		lgilab)           start_lgilab ;;
#		hex)              start_hex ;;
#		taskwarrior)      start_taskwarrior ;;
#		taskwarrior-todo) start_taskwarrior_todo ;;
#		*) echo unknown module ;;
#	esac
fi
