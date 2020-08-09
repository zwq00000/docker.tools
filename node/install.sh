#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

BIN_PATH=$1


echo ln -s -f `pwd`/nodeenv.sh $BIN_PATH/nodeenv
ln -s -f `pwd`/nodeenv.sh $BIN_PATH/nodeenv

echo ln -s -f `pwd`/nodejs.sh $BIN_PATH/nodejs
ln -s -f `pwd`/nodejs.sh $BIN_PATH/nodejs

echo ln -s -f `pwd`/node.sh $BIN_PATH/node
ln -s -f `pwd`/node.sh $BIN_PATH/node

echo ln -s -f `pwd`/npm.sh $BIN_PATH/npm
ln -s -f `pwd`/npm.sh $BIN_PATH/npm

echo ln -s -f `pwd`/yarn.sh $BIN_PATH/yarn
ln -s -f `pwd`/yarn.sh $BIN_PATH/yarn

echo ln -s -f `pwd`/npx.sh $BIN_PATH/npx
ln -s -f `pwd`/npx.sh $BIN_PATH/npx

echo ln -s -f `pwd`/npm-runtime.sh $BIN_PATH/npm-runtime
ln -s -f `pwd`/npm-runtime.sh $BIN_PATH/npm-runtime

nodeenv init
npm config set prefix $HOME/.npm/global
npm config set registry https://registry.npm.taobao.org