#!/bin/sh

cd $(dirname $0)
git pull -q

cd .powerlevel10k
git checkout origin/master
git pull -q origin master
cd ..

cd .zsh-autosuggestions
git checkout origin/master
git pull -q origin master
cd ..
