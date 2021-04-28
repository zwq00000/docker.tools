#!/bin/bash

imageName=library/centos:8

echo "Use docker image ${imageName}"

localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.local/share/kite

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
        -v $HOME/.config:$HOME/.config \
        -v $HOME/.kite:$HOME/.kite \
        -v $HOME/.local:$HOME/.local \
        -v `pwd`:`pwd` -w `pwd` $imageName bash
}

if [ "$1" = "install" ] ;then
    init
    exit
fi

docker run --rm -d --name kited \
-u $UID:$UID --userns=host \
-e PATH=$localpath \
--network=host \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v $HOME/.config:$HOME/.config \
-v $HOME/.kite:$HOME/.kite \
-v $HOME/.local:$HOME/.local \
-w ~/ $imageName kited --system-boot