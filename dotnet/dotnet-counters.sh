#!/bin/bash
# dotnet tools counters sidecar

if [[ $# -lt 1 ]]; then
    echo "dotnet counters for docker sidecar"
    echo "USAGE: dotnet-counters <container id|name>"
    docker ps | grep dotnet
    exit
fi

containerId=$1
shift
merged=`docker inspect --format="{{.GraphDriver.Data.MergedDir}}" $containerId`

docker run --rm -it \
--pid=container:$containerId \
-v $merged/tmp:/tmp \
-v `pwd`:`pwd` \
-w `pwd`:`pwd` \
zwq00000/dotnet-tools dotnet-counters $*


