#!/bin/bash
echo "Start golang in Docker Container ..."

docker volume create shared_local_go
docker volume create shared_go_cache

docker run -it --rm --name golang \
-u $UID --userns=host \
-v shared_local_go:/go \
-v shared_go_cache:/.cache \
-v `pwd`:`pwd` -w `pwd` golang go $*

echo "Exit golang Docker Container"