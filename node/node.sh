#!/bin/bash

imageName=library/node:12

echo "Use docker image ${imageName}"

localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.npm/global/bin
SHARE_VALUME=npm_home_for_$USER
# Create User Profile Volume
docker volume create $SHARE_VALUME

docker run -i --rm -u $UID:$UID --userns=host \
-e PATH=$localpath \
--network=host \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v $SHARE_VALUME:$HOME \
-v `pwd`:`pwd` -w `pwd` $imageName $*

