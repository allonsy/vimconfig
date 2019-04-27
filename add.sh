#!/bin/bash
set -e

if [ "$#" -ne 1 ]; then
    echo "Please provide a repo to clone"
    exit 1
fi

cd ~/.vim/pack/allonsy/start
git submodule add $1
PKG_NAME=$(basename $1 .git)
if [ -e $PKG_NAME/doc ]; then
    vim -u NONE -c "helptags $PKG_NAME/doc" -c q
fi
