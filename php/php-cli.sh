#!/bin/bash
imageName=$PHP_IMAGE
echo "Use docker image $imageName"

localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

docker run -it --rm -u $UID:$UID --userns=host \
-e PATH=$localpath \
--network=host \
-v /etc/localtime:/etc/localtime:ro \
-v `pwd`:`pwd` -w `pwd` $imageName $*