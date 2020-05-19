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

echo create share volume

SHARE_VOLUME=dotnet_home_for_$USER
# Create User home Volume
docker volume create $SHARE_VOLUME

docker run  --rm --userns=host \
-e HOME=$HOME \
-v $SHARE_VOLUME:$HOME/ \
 $imageName chown -R $UID:$UID $HOME/