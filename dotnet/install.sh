#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

BIN_PATH=$1

echo ln -s -f `pwd`/dotnetshell.sh $BIN_PATH/dotnetshell 
ln -s -f `pwd`/dotnetshell.sh $BIN_PATH/dotnetshell 

echo ln -s -f `pwd`/dotnet.sh $BIN_PATH/dotnet 
ln -s -f `pwd`/dotnet.sh $BIN_PATH/dotnet 