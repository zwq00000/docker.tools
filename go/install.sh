#!/bin/bash
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

source_path=$(dirname $(readlink -f $0))
cd $source_path

BIN_PATH=$1

echo  ln -s -f `pwd`/go.sh $BIN_PATH/go 
ln -s -f `pwd`/go.sh $BIN_PATH/go 

echo  ln -s -f `pwd`/goshell.sh $BIN_PATH/goshell
ln -s -f `pwd`/goshell.sh $BIN_PATH/goshell

echo  ln -s -f `pwd`/gofmt.sh $BIN_PATH/gofmt
ln -s -f `pwd`/gofmt.sh $BIN_PATH/gofmt

goshell init




