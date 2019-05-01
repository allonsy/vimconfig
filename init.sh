#!/bin/bash

set -e

git submodule init
git submodule update
cd ~/.vim/pack/allonsy/start

for SUBMOD in $(ls); do
    vim -u NONE -c "helptags $SUBMOD/doc" -c q
done
