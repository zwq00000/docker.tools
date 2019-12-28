#!/bin/bash
imageName=golang
echo "Start ${imageName} in Docker shell ..."

SHARE_VALUME=shared_go_cache

start()
{
    docker run -it --rm --name golang \
        -u $UID:$UID --userns=host \
        --network=host \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/passwd:/etc/passwd:ro \
        -v /etc/group:/etc/group:ro \
        -v $SHARE_VALUME:$HOME/.cache \
        -v `pwd`:`pwd` -w `pwd` $imageName  /bin/bash $*
}

init()
{
    docker volume create shared_go_cache

    docker run  --rm --userns=host \
    -e HOME=$HOME \
    -v $SHARE_VALUME:$HOME/.cache  \
    $imageName chown -R $UID:$UID $HOME/.cache
}

if  [ "$1" = "init" ];then
    echo 'init ${imageName} env '
    init
else
    start $*
fi

echo "Exit ${imageName} Docker shell"