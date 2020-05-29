#!/bin/bash
imageName=microsoft/dotnet:2.2-sdk
echo "use docker image ${imageName}"

SHARE_VALUME=dotnet_home_for_$USER

docker run  --rm -t --name dotnetenv_$cur_dateTime \
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