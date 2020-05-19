#!/bin/bash
imageName=mcr.microsoft.com/dotnet/core/sdk:3.1
echo "use docker image ${imageName}"

SHARE_VOLUME=dotnet_home_for_$USER
# Create User home Volume
docker volume create $SHARE_VOLUME

docker run  --rm -it --name dotnetenv_$cur_dateTime \
-u $UID:$UID --userns=host \
--network host \
-e HOME=$HOME \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v $SHARE_VOLUME:$HOME \
-v `pwd`:`pwd` -w `pwd` \
$imageName dotnet $*