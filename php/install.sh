#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

BIN_PATH=$1

echo ln -s -f `pwd`/php-cli.sh $BIN_PATH/php-cli
ln -s -f `pwd`/php-cli.sh $BIN_PATH/php-cli

echo ln -s -f `pwd`/php-cli.sh $BIN_PATH/php-5.6
ln -s -f `pwd`/php-5.6.sh $BIN_PATH/php-5.6

echo ln -s -f `pwd`/php-cli.sh $BIN_PATH/php-7.1
ln -s -f `pwd`/php-7.1.sh $BIN_PATH/php-7.1

echo ln -s -f `pwd`/php-cli.sh $BIN_PATH/php-7.2
ln -s -f `pwd`/php-7.2.sh $BIN_PATH/php-7.2
