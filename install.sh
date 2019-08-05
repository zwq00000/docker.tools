#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

# Link shell file to ~/bin
ln -s -f `pwd`/dotnetenv.sh ~/bin/dotnetenv 
ln -s -f `pwd`/dotnet.sh ~/bin/dotnet 
ln -s -f `pwd`/git.sh ~/bin/git 
ln -s -f `pwd`/go.sh ~/bin/go 
ln -s -f `pwd`/nodeenv.sh ~/bin/nodeenv 
ln -s -f `pwd`/nodejs.sh ~/bin/nodejs 
ln -s -f `pwd`/node.sh ~/bin/node 
ln -s -f `pwd`/npm.sh ~/bin/npm 
ln -s -f `pwd`/npx.sh ~/bin/npx 
ln -s -f `pwd`/pythonenv.sh ~/bin/pythonenv 
ln -s -f `pwd`/python.sh ~/bin/python 
ln -s -f `pwd`/ruby.sh ~/bin/ruby 
ln -s -f `pwd`/yarn.sh ~/bin/yarn 
ln -s -f `pwd`/php-cli.sh ~/bin/php-cli