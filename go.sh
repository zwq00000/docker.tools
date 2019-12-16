#!/bin/bash
imageName=golang
echo "Start ${imageName} in Docker Container ..."

docker volume create shared_local_go
docker volume create shared_go_cache

docker run -it --rm --name golang \
-u $UID:$UID --userns=host \
-v shared_local_go:/go \
-v shared_go_cache:/.cache \
-v `pwd`:`pwd` -w `pwd` $imageName go $*

echo "Exit golang Docker Container"