#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

BIN_PATH=$1

echo ln -s -f `pwd`/dotnetenv.sh $BIN_PATH/dotnetenv 
ln -s -f `pwd`/dotnetenv.sh $BIN_PATH/dotnetenv 

echo ln -s -f `pwd`/dotnet.sh $BIN_PATH/dotnet 
ln -s -f `pwd`/dotnet.sh $BIN_PATH/dotnet 