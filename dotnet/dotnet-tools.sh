#!/bin/bash

merged=`docker inspect --format="{{.GraphDriver.Data.MergedDir}}" $1`

docker run --rm -it \
--pid=container:$1 \
-v $merged/tmp:/tmp \
zwq00000/dotnet-tools


