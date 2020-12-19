#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

# BIN_PATH=$HOME/bin

# if [ -d "$HOME/bin" ] ; then
#     BIN_PATH="$HOME/bin"
# fi

# # set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/.local/bin" ] ; then
#     BIN_PATH="$HOME/.local/bin"
# fi

# # set BIN_PATH so it includes user's private bin if it exists
# if [ -d "/snap/bin" ] ; then
#     BIN_PATH="/snap/bin"
# fi

# if [ "$BIN_PATH" = ""];then
#     echo "make ~/bin"
#     mkdir ~/bin
# fi

if [ "$1" = "" ];then
    echo "Usage: install [options] "
    echo "  Install docker tool  options "
    echo "  options = go,node,dotnet "
fi

if  [ "$1" = "go" ];then
    ./go/install.sh $BIN_PATH
fi

if  [ "$1" = "node" ];then
    ./node/install.sh $BIN_PATH
fi

if  [ "$1" = "dotnet" ];then
    ./dotnet/install.sh $BIN_PATH
fi