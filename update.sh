#!/bin/sh

cd $(dirname $0)
git pull -q
git submodule update --init --recursive
