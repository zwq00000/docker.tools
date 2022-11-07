#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

if [ "$1" = "" ];then
    echo "Usage: install [options] "
    echo "  Install docker tool  options "
    echo "  options = go,node,dotnet,php,mqtt "
fi

if  [ "$1" = "go" ];then
    ./go/install.sh
fi

if  [ "$1" = "node" ];then
    ./node/install.sh
fi

if  [ "$1" = "dotnet" ];then
    ./dotnet/install.sh
fi

if  [ "$1" = "php" ];then
    ./php/install.sh
fi

if  [ "$1" = "python" ];then
    ./python/install.sh
fi 

if [ "$1" = "tools" ];then
    ./tools/install.sh
fi

if [ "$1" = "mqtt" ];then
    ./mqtt/install.sh
fi
