#!/bin/sh

cd $(dirname $0)
git pull -q

cd .powerlevel10k
git checkout -q origin/master
git pull -q origin master
cd ..

cd .zsh-autosuggestions
git checkout -q origin/master
git pull -q origin master
cd ..
