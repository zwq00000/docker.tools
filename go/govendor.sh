#!/bin/bash
imageName=golang
echo "Start ${imageName} in Docker shell ..."

SHARE_VALUME=go_cache_for_$USER
ROOT_VALUME=go_root_for_$USER

gopath=$HOME/go
localpath=/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$gopath/bin


docker run -t --rm --name golang \
    -u $UID:$UID --userns=host \
    --network=host \
    -e GOENV=$gopath/env \
    -e GOCACHE=$gopath/go-build \
    -e GOPATH=$gopath \
    -e GOPROXY=https://mirrors.aliyun.com/goproxy/,direct \
    -e PATH=$localpath \
    -v /etc/localtime:/etc/localtime:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v $SHARE_VALUME:$HOME/go \
    -v $ROOT_VALUME:/root \
    -v `pwd`:`pwd` -w `pwd` $imageName   govendor $*

