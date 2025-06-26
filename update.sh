#!/bin/sh

cd $(dirname $0)
git pull -q

for d in .powerlevel10k .zsh-autosuggestions; do
	cd $d
	git checkout -q origin/master
	git pull -q origin master
	cd ..
done

for d in .zinit; do
	cd $d
	git checkout -q origin/main
	git pull -q origin main
	cd ..
done
