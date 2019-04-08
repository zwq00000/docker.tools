#!/bin/bash
echo "use docker image library/node:8.12.0"
localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/node/.npm/local/bin
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
docker volume create shared_node_modules

docker run -it --rm -u $UID --userns=host \
-e PATH=$localpath \
--network host \
-v $SHELL_FOLDER/.npm/.npmrc:/home/node/.npmrc \
-v shared_node_modules:/home/node/.npm \
-v `pwd`:`pwd` -w `pwd` library/node:8.12.0 node $*
