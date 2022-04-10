#!/bin/bash
if [ -z "${DOTNET_SDK}" ];then
    # 默认 dotnet sdk sdk5.0
    DOTNET_SDK='mcr.microsoft.com/dotnet/sdk:6.0'
    echo "SET DOTNET_SDK $DOTNET_SDK"
fi

imageName=$DOTNET_SDK
echo 'start dotnet use '$imageName

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
