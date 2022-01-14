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

sed -i -e "/alias go/d" ~/.bash_alias
echo "alias go='$PWD/go.sh'" >> ~/.bash_alias
echo "alias goshell='$PWD/goshell.sh'" >> ~/.bash_alias
echo "alias gofmt='$PWD/go.sh gofmt'" >> ~/.bash_alias
echo "alias govendor='$PWD/go.sh govendor'" >> ~/.bash_alias

. ~/.bash_alias

source ~/.bash_aliases
init