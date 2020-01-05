#!/bin/bash
imageName=golang
echo "Start ${imageName} in Docker shell ..."

SHARE_VALUME=shared_go_cache
ROOT_VALUME=shared_go_root
gopath=$HOME/go
localpath=/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$gopath/bin

start()
{
    docker run -it --rm --name goshell \
        -u $UID:$UID --userns=host \
        --network=host \
        -e GOCACHE=$gopath/go-build \
        -e GOPATH=$gopath \
        -e PATH=$localpath \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/group:/etc/group:ro \
        -v $SHARE_VALUME:$HOME/go \
        -v $ROOT_VALUME:/root \
        -v `pwd`:`pwd` -w `pwd` \
        $imageName  /bin/bash $*
}

init()
{
    docker volume create $SHARE_VALUME
    docker volume create $ROOT_VALUME

    docker run  --rm -it \
    -e HOME=$HOME \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v $SHARE_VALUME:$HOME/go  \
    -v $ROOT_VALUME:/root \
    $imageName  \
     chown -R $UID:$UID $HOME/go &&  \
     ls $HOME -la & \
     /bin/bash
     #chown -R $UID:$UID /root
}

if  [ "$1" = "init" ];then
    echo 'init ${imageName} env '
    init
else
    start $*
fi

echo "Exit ${imageName} Docker shell"


