#!/bin/bash
imageName=golang:1.10

SHARE_VALUME=go_cache_for_$USER
ROOT_VALUME=go_root_for_$USER
gopath=$HOME/.go
localpath=/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$gopath/bin

docker run -it --rm \
        -u $UID:$UID --userns=host \
        --network=host \
        -e GOENV=$gopath/env \
        -e GOCACHE=$gopath/go-build \
        -e GOPATH=$gopath \
        -e GOBIN=$gopath/bin \
        -e GOMODCACHE=$gopath/pkg/mod \
        -e GO111MODULE=on \
        -e GOPROXY=https://goproxy.cn,direct \
        -e PATH=$localpath \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/group:/etc/group:ro \
        -v $SHARE_VALUME:$gopath \
        -v `pwd`:`pwd` -w `pwd` \
        $imageName  $*