#!/bin/sh

# for when already compiled .terminfo does not cut it, run this to
# compile sources on current system
for f in $(find .terminfo-src -type f); do
        TERMINFO=${HOME}/.terminfo tic ${f}
done
