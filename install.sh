#!/bin/sh

cd "$(dirname "${0}")"
script_dir="$(pwd)"

# list of dsts to create links to, paths should be in relative to ${HOME}
files=".Xmodmap
.Xresources
.dircolors
.tmux
.tmux-nest.conf
.tmux.conf
.vim
.vimrc
.zshrc
.powerlevel10k
.p10k.zsh
.terminfo
.config/mc
.local/share/mc/skins/lm-.ini
.termcap
.dialogrc
.zsh-autosuggestions
"

# https://git-scm.com/docs/git-pull#_bugs
git submodule update --init --recursive
# until above is fixed, we need both lines, once it's fixed
# we only will need below line
git pull --recurse-submodules --jobs=8

for f in ${files}; do
	dst="${HOME}/${f}"
	src="${script_dir}/${f}"

	echo "linking ${dst} -> ${src}"

	if [ -f "${src}" ]; then
		# we are linking to file
		ddir="$(dirname "${dst}")"
		if [ ! -d "${ddir}" ]; then
			# destination directory does not exist for the file,
			# create it
			mkdir -p "$(dirname "${dst}")"
		fi
	fi

	if [ -e "${dst}" ]; then
		ftype=$(stat --printf=%F "${dst}")
		printf "${dst} (${ftype}) already exist, remove (type YES)? "
		read choice
		if [ "x${choice}" = "xYES" ]; then
			if [ ! -L "${dst}" ] && [ -d "${dst}" ]; then
				rm -rI "${dst}"
			else
				unlink "${dst}"
			fi
		else
			echo "answer is not YES, not removing, ignoring file"
			continue
		fi
	fi

	ln -s "${src}" "${dst}"
done
