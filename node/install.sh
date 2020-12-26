#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

echo "alias nodeenv='$PWD/nodeenv.sh'" >> ~/.bash_aliases
echo "alias nodejs='$PWD/nodejs.sh'" >> ~/.bash_aliases
echo "alias node='$PWD/node.sh'" >> ~/.bash_aliases
echo "alias npm='$PWD/npm.sh'" >> ~/.bash_aliases
echo "alias yarn='$PWD/yarn.sh'" >> ~/.bash_aliases
echo "alias npx='$PWD/npx.sh'" >> ~/.bash_aliases
echo "alias npm-runtime='$PWD/npm-runtime.sh'" >> ~/.bash_aliases

source ~/.bash_aliases

nodeenv init
npm config set prefix $HOME/.npm/global
npm config set registry https://registry.npm.taobao.org