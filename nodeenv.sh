#!/bin/bash

imageName=library/node:12
echo "Use docker image ${imageName}"

#first runtime use npm config set prefix "$HOME/.npm/global"
# and 'npm config set registry https://registry.npm.taobao.org'

echo 'first time  exec "npm config set prefix $HOME/.npm/global \ '
echo 'npm config set registry https://registry.npm.taobao.org'

localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/node/.npm/local/bin
SHARE_VALUME=npm_home_for_$USER
# Create User Profile Volume
docker volume create $SHARE_VALUME

# fix home path own
docker run  --rm --userns=host \
-e HOME=$HOME \
-v $SHARE_VALUME:$HOME/ \
 $imageName chown -R $UID:$UID $HOME/

docker run -it --rm -u $UID:$UID --userns=host \
-e PATH=$localpath \
--network=host \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v $SHARE_VALUME:$HOME \
-v `pwd`:`pwd` -w `pwd` \
$imageName /bin/bash $*

