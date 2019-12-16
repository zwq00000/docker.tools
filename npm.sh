#!/bin/bash

imageName=library/node:12
echo "use docker image ${imageName}"

localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/node/.npm/local/bin
SHARE_VALUME=npm_home_for_$USER
# Create User Profile Volume
docker volume create $SHARE_VALUME

echo "Use Shared Volume $SHARE_VALUME"

docker volume create $SHARE_VALUME

docker run -it --rm --userns=host \
-e PATH=$localpath \
--network host  \
-v $SHARE_VALUME:/home/node/ \
-v `pwd`:`pwd` -w `pwd` \
$imageName npm $*

