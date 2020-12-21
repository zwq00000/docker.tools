#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

echo "alias nodeenv='$PWD/nodeenv.sh'" >> ~/.bash_alias
echo "alias nodejs='$PWD/nodejs.sh'" >> ~/.bash_alias
echo "alias node='$PWD/node.sh'" >> ~/.bash_alias
echo "alias npm='$PWD/npm.sh'" >> ~/.bash_alias
echo "alias yarn='$PWD/yarn.sh'" >> ~/.bash_alias
echo "alias npx='$PWD/npx.sh'" >> ~/.bash_alias
echo "alias npm-runtime='$PWD/npm-runtime.sh'" >> ~/.bash_alias

. ~/.bash_alias

nodeenv init
npm config set prefix $HOME/.npm/global
npm config set registry https://registry.npm.taobao.org