# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if type dircolors >/dev/null; then
	# non gnu systems do not have dircolors
	eval `dircolors -b ~/.dircolors`
fi

if [ $(hostname) = "marchewa" ]; then
	[ -z "$TERM" ] && export TERM=rxvt-256color-italic
	[ -n "$TMUX" ] && export TERM=tmux-256color-italic
else
	[ -z "$TERM" ] && export TERM=rxvt-256color
	[ -n "$TMUX" ] && export TERM=tmux-256color
fi

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '~/.zshrc'

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

autoload -Uz compinit
compinit
if hash task 2>/dev/null; then
	compdef todo=task
fi

setopt correctall
setopt appendhistory
setopt extendedglob
setopt nomatch
setopt notify
setopt hist_ignore_all_dups

unsetopt correct_all
unsetopt correct
unsetopt autocd
unsetopt beep

umask 026

HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

export UNICODE_FONT=1
export NMON=cmdlkn
export LD_LIBRARY_PATH="/usr/local/lib64"
export PATH="/usr/bofc/bin:/home/lm-/.local/bin:$PATH:/usr/arm-nuttx-eabi/bin:/usr/local/bin:/home/lm-/.laptop-profiles"
export QT_SELECT=5
export XDG_CURRENT_DESKTOP=qt5ct
export QT_QPA_PLATFORM_THEME=qt5ct
export QT_QPA_PLATFORMTHEME=qt5ct
export DISPLAY=:0
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export KANBANFILE="${HOME}/.kanban.csv"
export WINEPREFIX=~/.wine32
export XDG_RUNTIME_DIR=/tmp/xdg-runtime-dir.$(whoami)
export PULSE_RUNTIME_PATH=$XDG_RUNTIME_DIR/pulse
export BROWSER="/usr/bofc/bin/open -n"
export XDG_CONFIG_HOME=${HOME}/.config
export EDITOR=vim
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR

# keybinds

# vim mode ftw
bindkey -v
# make ,, act like esc (to go to normal mode)
bindkey -s ,, '\e'

bindkey '^r' history-incremental-pattern-search-backward
bindkey '^w' backward-kill-word
autoload -U select-word-style
select-word-style bash
#export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>\/'

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# allow the use of the Home/End keys
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
# map "page up" and "page down" to search history based on current cmdline
bindkey "\e[5~" history-search-backward
bindkey "\e[6~" history-search-forward
# allow the use of the Delete/Insert keys
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert

[ $TERM = "rxvt" ] && bindkey "\e[8~" end-of-line

# custom aliases

alias ls='ls --color --group-directories-first'
alias l='ls -lh --group-directories-first'
alias lsa='ls -lha --group-directories-first'
alias grep='grep --color=auto --exclude-dir=".svn" --exclude-dir=".git"'
alias oegrep='grep --color=auto --exclude-dir="build-brcm97449svms-refboard" --exclude-dir="downloads" --exclude-dir="sstate-cache" -rIs'
alias gitg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gits='git status -s'
alias gitc='git commit -s --verbose'
alias gitt='git log --tags --simplify-by-decoration --pretty="format:%ci %d"'
alias ta='tmux attach -t'
alias ipa='ip -br -c a'
alias ipr='ip -br -c r'
alias ipra='ip -br -c route show table all'
#alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tb="nc tb.kurwinet.pl 8002"
alias mkpass='makepasswd --chars=31'
alias sshf='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias scpf='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias sshbox='sshpass -p TdBdTncY ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no '
alias youtube-ogg='youtube-dl --audio-format vorbis --audio-quality 0 --extract-audio'
alias mem-stat='ps -e -orss=,args= | sort -b -k1,1n'
alias notify-phone='sendxmpp -t -n lm-notif@kurwinet.pl'
alias mutt-aspi.net.pl='mutt -F ~/.muttrc.aspi.net.pl'
alias mutt-rss='mutt -F ~/.muttrc.rss'
alias youtube-viewer='youtube-viewer --order=viewCount --player=mpv'

alias ts-nc="{ cat -; echo 'termsend'; } | nc termsend.pl 1337"
alias tst-nc="nc termsend.pl 1338"
alias ts="socat - TCP:termsend.pl:1337"
alias tss="socat - OPENSSL:termsend.pl:1339,cafile=${HOME}/.ca/termsend.crt"

alias prh='profile home'
alias prw='profile work'
alias prs='profile standalone'
alias gitl='GIT_DIR=.git-local git'

function tcn() { TMUX= tmux -L${1} -f .tmux-nest.conf new -s ${1} }
function tln() { TMUX= tmux -L${1} list-sessions }
function tan() { TMUX= tmux -L${1} attach -t ${1} }

git-cherry-pick-to()
{
	what=${1}
	to=${2}

	current=$(git rev-parse --abbrev-ref HEAD)
	git checkout ${to}
	git cherry-pick ${what}
	git checkout ${current}
}

# cdfile allows to cd into file's directory, examples will
# explain this better than I:
#
# # this will classically cd into directory
# cd /some/dir
# # but this will cd into /i/am/dir
# cd /i/am/dir/and-i-am-a-file
#
# Usefull when you did 'vim /some/stupidly/long/path/file.c'
# but after that you want to quickly cd into that, so you
# can do quick "cd $_" and you're done - nice quality of life
cdfile()
{
	if [ -z "${1}" ]; then
		# empty cd needs special handling, since calling
		# builtin cd '' (empty var) will not cd into
		# home directory
		builtin cd
		return ${?}
	fi

	if [ -e "${1}" ] && [ ! -d "${1}" ]; then
		# cding into file (any, link, socket, dev) but no dir so,
		# simply cd to dirname
		builtin cd "$(dirname "${1}")"
		return ${?}
	fi

	# cding into real directory or nonexisting file(dir)
	# cd on its own can handle it
	builtin cd "${1}"
	return ${?}
}

# change directory and source first encoutered .rc file
# example: sourccd /home/lm-/projects/company-z/project-a
# will traverse from $(pwd) up and source first .rc in order:
# /home/lm-/projects/company-z/project-a/.rc
# /home/lm-/projects/company-z/.rc
# /home/lm-/projects/.rc
# /home/lm-/.rc
# /home/.rc
# /.rc
#
# Will source only files belonging to current user to prevent root
# from sourcing users dangerous rc when snooping in users dirs :>
sourcecd ()
{
	cdfile ${@} || return ${?}

	me=$(whoami)
	cwd=$(pwd)

	while true; do
		rc=${cwd}/.rc

		# source only file that we can read and belongs to us
		if [ -r "${rc}" ] && [ $(stat -c %U "${rc}") = ${me} ]; then
			source "${rc}"
			return 0
		fi

		if [ "${cwd}" = "/" ]; then
			# if we searched all dirs and still didn't find .zshrc,
			# load default source file, to make sure environment is
			# in default state when cding from /home/lm-/projects/asdf
			# to let's say /etc. Also do not source default ~/.zshrc
			# file which can be big and take a lot of time to source,
			# this may be good when starting new shell but imagine
			# waiting every time you cd.
			[ -r ~/.rc-default ] && source ~/.rc-default
			return 0
		fi

		cwd=$(dirname "${cwd}")
	done
}
alias cd=sourcecd

hex-to-bin() {
	n=$1
	echo "print(str(bin($n))[2:].zfill(34))" | python |
		cut -c3- | rev | sed 's/.\{4\}/& /g' | rev
	echo "   28   24   20   16   12    8    4    0"
}

less_color()
{
	LESSOPEN="| pygmentize -f terminal -O style=native -g %s" less $@
}
alias less-color=less_color

export LESS='-XRj.5'
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_so=$'\e[1;4;41m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export MANPAGER="less -+X -is"

if [ -r $HOME/.zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	ZSH_AUTOSUGGEST_STRATEGY=(completion history)
	# do not auto rebind - performance boost!
	# to rebind manually, run _zsh_autosuggest_bind_widgets
	ZSH_AUTOSUGGEST_MANUAL_REBIND=1
	source $HOME/.zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ ! -f ~/.p10k.zsh ] || source ~/.p10k.zsh
[ ! -f ~/.powerlevel10k/powerlevel10k.zsh-theme ] || source ~/.powerlevel10k/powerlevel10k.zsh-theme
# source machine custom file, could be used to override some aliases
# (like ls --colors which will not work on bsd) or do system specific
# stuff.
[ ! -f ~/.custom.zsh ] || source ~/.custom.zsh
