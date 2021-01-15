#!/bin/bash

imageName=library/centos:8

echo "Use docker image ${imageName}"

localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.local/share/kite
SHARE_VALUME=kite_for_$USER
# Create User Profile Volume
docker volume create $SHARE_VALUME

init()
{
    echo "start $imageName "

    docker run -it --rm --name kited \
        -u $UID:$UID --userns=host \
        -e PATH=$localpath \
        --network=host \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/group:/etc/group:ro \
        -v $SHARE_VALUME:$HOME \
        -v `pwd`:`pwd` -w `pwd` $imageName bash
}

if [ "$1" = "install" ] ;then
    init
    exit
fi

docker run -d --name kited \
-u $UID:$UID --userns=host \
-e PATH=$localpath \
--network=host \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v $SHARE_VALUME:$HOME \
   $imageName kited