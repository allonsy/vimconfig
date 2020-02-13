#!/bin/bash
set -e
PACKAGE_NAME='*'
if [ $# -ge 1 ]; then
    PACKAGE_NAME=$1
fi

function update_package() {
    echo "Updating: $1"
    git submodule update --init $1
    cd $1
    git pull origin master
    vim -u NONE -c "helptags doc" -c q
    cd ..
}
    
cd ~/.vim/pack/allonsy/start
if [ "$PACKAGE_NAME" = '*' ]; then
    echo "Updating all packages"
    for package in `ls`; do
        update_package $package
    done
else
    update_package $1
fi
