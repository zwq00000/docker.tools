#!/bin/bash
imageName=golang
echo "Start ${imageName} in Docker shell"

SHARE_VALUME=shared_go_cache

gopath=$HOME/go
localpath=/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$gopath/bin

docker run -it --rm --name golang \
    -u $UID:$UID --userns=host \
    --network=host \
    -v /etc/localtime:/etc/localtime:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v $SHARE_VALUME:$HOME/go \
    -v `pwd`:`pwd` -w `pwd` \
    $imageName  gofmt  $*