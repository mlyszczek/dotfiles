#!/bin/sh

cd $(dirname $0)
git pull -q

cd .powerlevel10k
git pull -q
cd ..

cd .zsh-autosuggestions
git pull -q
cd ..
