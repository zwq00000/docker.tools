#!/bin/bash
echo "use docker image library/node:8.12.0"

localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/node/.npm/local/bin
SHELL_FOLDER=$(dirname $(readlink -f "$0"))

docker run -it --rm -u $UID --userns=host -e PATH=$localpath \
-v $SHELL_FOLDER/.npmrc:/home/node/.npmrc -v $SHELL_FOLDER/.npm:/home/node/.npm -v $SHELL_FOLDER/.npm/local:/home/node/.npm/local \
-v `pwd`:`pwd` -w `pwd` library/node:8.12.0 npm $*

