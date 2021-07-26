#!/bin/bash
gopath=$HOME/go
localpath=/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$gopath/bin

if [ -f $gopath ]; then
    mkdir $gopath
fi

docker run -it --rm \
        -u $UID:$UID --userns=host \
        -e GOPATH=$gopath \
        -e GOBIN=$gopath/bin \
        -e GOMODCACHE=$gopath/pkg/mod \
        -e GOCACHE=$gopath/.cache/go-build \
        -e GOENV=$gopath/env \
        -e GOPROXY=https://goproxy.cn,direct \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/group:/etc/group:ro \
        -v $gopath:$gopath \
        -v `pwd`:`pwd` -w `pwd` \
        golang  go $*
