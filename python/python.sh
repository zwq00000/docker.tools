#!/bin/bash

imageName=python:3
SHARE_VALUME=python_pip_for_$USER

docker run  --rm -it --name python_$pwd \
-u $UID:$UID --userns=host \
--network host \
-e HOME=$HOME \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v  /etc/localtime:/etc/localtime:ro \
-v `pwd`:`pwd` -w `pwd` \
-v $SHARE_VALUME:$HOME/.cache/pip \
$imageName $*