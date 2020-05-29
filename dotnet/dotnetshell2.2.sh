#!/bin/bash
###################
##  dotnet sdk env
###################
imageName=microsoft/dotnet:2.2-sdk
echo "use docker image ${imageName}"
cur_dateTime=`date +%m%d%H%m`
echo $cur_dateTime

SHARE_VALUME=dotnet_home_for_$USER

docker run  --rm -it --name dotnetenv_$cur_dateTime \
-u $UID:$UID --userns=host \
--network host \
-e HOME=$HOME \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v  /etc/localtime:/etc/localtime:ro \
-v $SHARE_VALUME:$HOME \
-v `pwd`:`pwd` -w `pwd` \
$imageName /bin/bash $*