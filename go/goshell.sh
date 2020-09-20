#!/bin/bash
imageName=golang
echo "Start ${imageName} in Docker shell ..."

SHARE_VALUME=go_cache_for_$USER
goroot=$HOME/go
localpath=/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$goroot/bin

docker run -it --rm \
    -u $UID:$UID --userns=host \
    --network=host \
    -e GOENV=$goroot/env \
    -e GOCACHE=$goroot/go-build \
    -e GOPATH=`pwd` \
    -e GOBIN=$goroot/bin \
    -e GOPROXY=https://mirrors.aliyun.com/goproxy/,direct \
    -e PATH=$localpath \
    -v /etc/localtime:/etc/localtime:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v $SHARE_VALUME:$HOME/go \
    -v `pwd`:`pwd` -w `pwd` \
    $imageName  /bin/bash $*

echo "Exit ${imageName} Docker shell"


