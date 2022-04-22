#!/bin/sh

git add $1
git commit -m "update $1"
git push --all
