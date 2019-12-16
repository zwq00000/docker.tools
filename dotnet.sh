#!/bin/bash
imageName=microsoft/dotnet:2.2-sdk
echo "use docker image ${imageName}"

SHARE_VALUME=dotnet_home_for_$USER
# Create User home Volume
docker volume create $SHARE_VALUME

## fix volume Permission denied
docker run  --rm --userns=host \
-e HOME=/home/dotnet \
-v $SHARE_VALUME:/home/dotnet/ \
 microsoft/dotnet:2.2-sdk chown -R $UID:$UID /home/dotnet/

docker run  --rm -u $UID:$UID --userns=host \
-e HOME=/home/dotnet \
--network host \
-v $SHARE_VALUME:/home/dotnet/ \
-v `pwd`:`pwd` -w `pwd` \
 $imageName dotnet $*