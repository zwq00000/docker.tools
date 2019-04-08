#!/bin/bash
## user ~/.npmrc and ~/.npm folder
echo "Entry docker container library/node:8.12.0"
localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/node/.npm/local/bin
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
SHARE_VALUME=shared_npm_for_$USER
docker volume create $SHARE_VALUME

docker run -it --rm -u $UID --userns=host \
-e PATH=$localpath \
--network=host \
-v $SHELL_FOLDER/.npmrc:/home/node/.npmrc \
-v $SHARE_VALUME:/home/node/.npm \
-v `pwd`:`pwd` -w `pwd` library/node:8.12.0 yarn $*

echo "Exit docker container"