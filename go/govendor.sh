#!/bin/bash
imageName=golang
echo "Start ${imageName} in Docker shell ..."

SHARE_VALUME=shared_go_cache

docker run -it --rm --name golang \
-u $UID:$UID --userns=host \
--network=host \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v $SHARE_VALUME:$HOME/.cache \
-v `pwd`:`pwd` -w `pwd` $imageName   golang govendor $*
