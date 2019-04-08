#!/bin/bash
echo "use docker image library/node:8.12.0"

localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/node/.npm/local/bin
SHARE_VALUME=npm_home_for_$USER
# Create User Profile Volume
docker volume create $SHARE_VALUME

echo "Use Shared Volume $SHARE_VALUME"

docker volume create $SHARE_VALUME

docker run -it --rm --userns=host \
-e PATH=$localpath \
--network host  \
-v $SHARE_VALUME:/home/node/.npm  \
-v `pwd`:`pwd` -w `pwd` library/node:8.12.0 npm $*

