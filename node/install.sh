#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

echo "alias nodeenv='$PWD/nodeenv.sh'" >> ~/.aliasrc
echo "alias nodejs='$PWD/nodejs.sh'" >> ~/.aliasrc
echo "alias node='$PWD/node.sh'" >> ~/.aliasrc
echo "alias npm='$PWD/npm.sh'" >> ~/.aliasrc
echo "alias yarn='$PWD/yarn.sh'" >> ~/.aliasrc
echo "alias npx='$PWD/npx.sh'" >> ~/.aliasrc
echo "alias npm-runtime='$PWD/npm-runtime.sh'" >> ~/.aliasrc

source ~/.aliasrc

nodeenv init
npm config set prefix $HOME/.npm/global
npm config set registry https://registry.npm.taobao.org