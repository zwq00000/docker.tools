#!/bin/bash

source_path=$(dirname $(readlink -f $0))

cd `{source_path}`

alias dt.dotnetenv=`pwd`/dotnetenv.sh

alias dt.dotnet=`pwd`/dotnet.sh

alias dt.git=`pwd`/git.sh

alias dt.go=`pwd`/go.sh

alias dt.nodeenv=`pwd`/nodeenv.sh

alias dt.nodejs=`pwd`/nodejs.sh

alias dt.node=`pwd`/node.sh

alias dt.npm=`pwd`/npm.sh

alias dt.npx=`pwd`/npx.sh

alias dt.pythonenv=`pwd`/pythonenv.sh

alias dt.python=`pwd`/python.sh

alias dt.ruby=`pwd`/ruby.sh

alias dt.yarn=`pwd`/yarn.sh

source ~/.bash_profile