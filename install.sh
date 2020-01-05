#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

BIN_PATH=$HOME/bin

if [ -d "$HOME/bin" ] ; then
    BIN_PATH="$HOME/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    BIN_PATH="$HOME/.local/bin"
fi

# set BIN_PATH so it includes user's private bin if it exists
if [ -d "/snap/bin" ] ; then
    BIN_PATH="/snap/bin"
fi

link_go()
{
    ln -s -f `pwd`/go.sh $BIN_PATH/go 
    ln -s -f `pwd`/goshell.sh $BIN_PATH/goshell
    ln -s -f `pwd`/go/gofmt.sh $BIN_PATH/gofmt
}

link_node()
{
    ln -s -f `pwd`/nodeenv.sh $BIN_PATH/nodeenv 
    ln -s -f `pwd`/nodejs.sh $BIN_PATH/nodejs 
    ln -s -f `pwd`/node.sh $BIN_PATH/node 
    ln -s -f `pwd`/npm.sh $BIN_PATH/npm 
    ln -s -f `pwd`/npx.sh $BIN_PATH/npx 
}

if  [ "$1" = "" ];then
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


# Link shell file to $BIN_PATH
#ln -s -f `pwd`/dotnetenv.sh $BIN_PATH/dotnetenv 
#ln -s -f `pwd`/dotnet.sh $BIN_PATH/dotnet 
#ln -s -f `pwd`/git.sh $BIN_PATH/git 
#ln -s -f `pwd`/go.sh $BIN_PATH/go 
#
#ln -s -f `pwd`/pythonenv.sh $BIN_PATH/pythonenv 
#ln -s -f `pwd`/python.sh $BIN_PATH/python 
#ln -s -f `pwd`/ruby.sh $BIN_PATH/ruby 
#ln -s -f `pwd`/yarn.sh $BIN_PATH/yarn 
#ln -s -f `pwd`/php-cli.sh $BIN_PATH/php-cli