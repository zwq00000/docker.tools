#!/bin/bash

imageName=python:3
SHARE_VALUME=python_pip_for_$USER

dockerCmd="docker run  --rm -it \
-u $UID:$UID --userns=host \
-e HOME=$HOME \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v $SHARE_VALUME:$HOME/.cache/pip \
-v \"`pwd`\":\"`pwd`\" \
-w \"`pwd`\" \
$imageName "

eval $dockerCmd pip $*