#!/bin/bash
## user ~/.npmrc and ~/.npm folder
imageName=library/node:12
echo "Entry docker container ${imageName}"
localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.npm/global/bin

SHARE_VALUME=shared_npm_for_$USER
docker volume create $SHARE_VALUME

docker run -it --rm -u $UID:$UID --userns=host \
-e PATH=$localpath \
--network=host \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v $SHARE_VALUME:$HOME \
-v `pwd`:`pwd` -w `pwd` \
$imageName yarn $*
