#!/bin/bash

echo "use docker image microsoft/dotnet:2.2-sdk"

SHARE_VALUME=dotnet_home_for_$USER
# Create User home Volume
docker volume create $SHARE_VALUME

## fix volume Permission denied
docker run  --rm --userns=host \
-e HOME=/home/dotnet \
-v $SHARE_VALUME:/home/dotnet/ \
 microsoft/dotnet:2.2-sdk chown -R $UID:$UID /home/dotnet/


docker run  --rm -u $UID --userns=host \
-e HOME=/home/dotnet \
-v $SHARE_VALUME:/home/dotnet/ \
-v `pwd`:`pwd` -w `pwd` \
 microsoft/dotnet:2.2-sdk dotnet $*