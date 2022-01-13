#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "dotnet counters for docker"
    echo "USAGE: dotnet-counters <container id|name>"
    docker ps | grep dotnet
    exit
fi

containerId=$1
shift
merged=`docker inspect --format="{{.GraphDriver.Data.MergedDir}}" $containerId`

docker run --rm -it \
--pid=container:$1 \
-v $merged/tmp:/tmp \
-w `pwd`:`pwd` \
zwq00000/dotnet-tools dotnet-counters @*


