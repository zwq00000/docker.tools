#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

BIN_PATH=$1

echo ln -s -f `pwd`/dotnetshell.sh $BIN_PATH/dotnetshell 
ln -s -f `pwd`/dotnetshell.sh $BIN_PATH/dotnetshell 

echo ln -s -f `pwd`/dotnetshell2.2.sh $BIN_PATH/dotnetshell2.2 
ln -s -f `pwd`/dotnetshell2.2.sh $BIN_PATH/dotnetshell2.2 

echo ln -s -f `pwd`/dotnetshell3.sh $BIN_PATH/dotnetshell3 
ln -s -f `pwd`/dotnetshell3.sh $BIN_PATH/dotnetshell3 

echo ln -s -f `pwd`/dotnet3.sh $BIN_PATH/dotnet 
ln -s -f `pwd`/dotnet3.sh $BIN_PATH/dotnet 

# init docker container and mount volume
imageName=mcr.microsoft.com/dotnet/core/sdk:3.1
SHARE_VALUME=dotnet_home_for_$USER
echo "Create SHARE_VALUME ${SHARE_VALUME}"
echo "chown share valume to ${UID}"
# Create User home Volume
docker volume create $SHARE_VALUME
docker run  --rm --userns=host \
    -e HOME=$HOME \
    -v $SHARE_VALUME:$HOME/ \
    $imageName chown -R $UID:$UID $HOME/
