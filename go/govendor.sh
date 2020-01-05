#!/bin/bash
imageName=golang
echo "Start ${imageName} in Docker shell ..."

SHARE_VALUME=shared_go_cache

gopath=$HOME/go
localpath=/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$gopath/bin

start()
{
    docker run -it --rm --name golang \
    -u $UID:$UID --userns=host \
    --network=host \
     -e GOCACHE=$gopath/go-build \
    -e GOPATH=$gopath \
    -e PATH=$localpath \
    -v /etc/localtime:/etc/localtime:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v $SHARE_VALUME:$HOME/go \
    -v `pwd`:`pwd` -w `pwd` $imageName   govendor $*
}

init()
{
    docker run -it --rm --name golang \
    -u $UID:$UID --userns=host \
    --network=host \
     -e GOCACHE=$gopath/go-build \
    -e GOPATH=$gopath \
    -e PATH=$localpath \
    -v /etc/localtime:/etc/localtime:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v $SHARE_VALUME:$HOME/go \
    -v `pwd`:`pwd` -w `pwd` $imageName   go get -u github.com/kardianos/govendor
}

if  [ "$1" = "init" ];then
    init
else
    start $*
fi