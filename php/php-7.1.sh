#!/bin/bash
echo "Use docker image php:7.1-cli"

localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/node/.npm/local/bin

docker run -it --rm -u $UID --userns=host \
-e PATH=$localpath \
--network=host \
-v /etc/localtime:/etc/localtime:ro \
-v `pwd`:`pwd` -w `pwd` php:7.1-cli $*