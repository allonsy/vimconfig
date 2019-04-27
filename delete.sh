#!/bin/bash

set -e

if [ $# -ne 1 ]; then
    echo "Please provide a package to remove"
    exit 1
fi

cd ~/.vim/pack/allonsy/start
git submodule deinit -f -- $1
rm -rf ~/.vim/.git/modules/pack/allonsy/$1
git rm -f $1
