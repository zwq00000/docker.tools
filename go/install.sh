#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

BIN_PATH=$1

echo  ln -s -f `pwd`/go.sh $BIN_PATH/go 
ln -s -f `pwd`/go.sh $BIN_PATH/go 

echo  ln -s -f `pwd`/goshell.sh $BIN_PATH/goshell
ln -s -f `pwd`/goshell.sh $BIN_PATH/goshell

echo  ln -s -f `pwd`/gofmt.sh $BIN_PATH/gofmt
ln -s -f `pwd`/gofmt.sh $BIN_PATH/gofmt