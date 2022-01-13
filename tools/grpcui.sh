#!/bin/bash

PUB_PORT=8080
GRPC_SERVER=$1
shift
# if [ "$2" != "" ];then
#     PUB_PORT=$2
#     echo "PUB_PORT $PUB_PORT"
# fi



docker run --rm \
    -e GRPCUI_SERVER=$GRPC_SERVER \
    -p $PUB_PORT:8080 \
wongnai/grpcui grpcui $*
