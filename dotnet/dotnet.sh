#!/bin/bash
imageName=$DOTNET_IMAGE
echo 'start dotnet use '+$imageName

SHARE_VALUME=dotnet_home_for_$USER

docker run  --rm -t --name dotnet_$cur_dateTime \
-u $UID:$UID --userns=host \
--network host \
-e HOME=$HOME \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v  /etc/localtime:/etc/localtime:ro \
-v $SHARE_VALUME:$HOME \
-v `pwd`:`pwd` -w `pwd` \
$imageName dotnet $*