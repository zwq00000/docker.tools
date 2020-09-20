#!/bin/bash
init()
{
    imageName=golang
    SHARE_VALUME=go_cache_for_$USER
    ROOT_VALUME=go_root_for_$USER
    gopath=$HOME/.go

    docker volume create $SHARE_VALUME
    docker volume create $ROOT_VALUME

    docker run --rm -t \
        -e HOME=$HOME \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/group:/etc/group:ro \
        -v $SHARE_VALUME:$gopath  \
        $imageName  \
            chown -R $UID:$UID $HOME/.go &&  \
            ls $HOME -la & \
            /bin/bash

    #go get -u github.com/kardianos/govendor
}

source_path=$(dirname $(readlink -f $0))
cd $source_path

BIN_PATH=$1

echo  ln -s -f `pwd`/go.sh $BIN_PATH/go 
ln -s -f `pwd`/go.sh $BIN_PATH/go 

echo  ln -s -f `pwd`/goshell.sh $BIN_PATH/goshell
ln -s -f `pwd`/goshell.sh $BIN_PATH/goshell

echo  ln -s -f `pwd`/gofmt.sh $BIN_PATH/gofmt
ln -s -f `pwd`/gofmt.sh $BIN_PATH/gofmt

init