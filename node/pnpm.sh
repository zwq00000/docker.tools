#!/bin/bash
## user ~/.npmrc and ~/.npm folder
imageName=library/node:12
# echo "Entry docker container ${imageName}"
localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.npm/global/bin

SHARE_VALUME=npm_home_for_$USER
# docker volume create $SHARE_VALUME

docker run -it --rm -u $UID:$UID --userns=host \
--network=host \
-e PATH=$localpath \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v $SHARE_VALUME:$HOME \
-v `pwd`:`pwd` -w `pwd` \
$imageName pnpm $*
