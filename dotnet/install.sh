#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

# BIN_PATH=$1

# echo ln -s -f `pwd`/dotnetshell.sh $BIN_PATH/dotnetshell 
# ln -s -f `pwd`/dotnetshell.sh $BIN_PATH/dotnetshell 

# echo ln -s -f `pwd`/dotnetshell2.2.sh $BIN_PATH/dotnetshell2.2 
# ln -s -f `pwd`/dotnetshell2.2.sh $BIN_PATH/dotnetshell2.2 

# echo ln -s -f `pwd`/dotnetshell3.sh $BIN_PATH/dotnetshell3 
# ln -s -f `pwd`/dotnetshell3.sh $BIN_PATH/dotnetshell3 

# echo ln -s -f `pwd`/dotnet.sh $BIN_PATH/dotnet 
# ln -s -f `pwd`/dotnet.sh $BIN_PATH/dotnet 
sdk2=microsoft/dotnet:2.2-sdk
sdk3=mcr.microsoft.com/dotnet/core/sdk:3.1
sdk5=mcr.microsoft.com/dotnet/sdk:5.0
cmd="export DOTNET_IMAGE=$sdk5 && $PWD/dotnetshell.sh"
echo $cmd
alias dotnetshell=$cmd

cmd="export DOTNET_IMAGE=$sdk2 && $PWD/dotnetshell.sh"
alias dotnetshell3=$cmd

"export DOTNET_IMAGE=$sdk3 && $PWD/dotnetshell.sh"
alias dotnetshell2=$cmd

cmd="export DOTNET_IMAGE=$sdk5 && $PWD/dotnet.sh"
alias dotnet=$cmd

cmd="export DOTNET_IMAGE=$sdk3 && $PWD/dotnet.sh"
alias dotnet2=$cmd

cmd="export DOTNET_IMAGE=$sdk3 && $PWD/dotnet.sh"
alias dotnet3="export DOTNET_IMAGE=$sdk3 && $PWD/dotnet.sh"

alias dotnet
alias dotnetshell

# init docker container and mount volume
# imageName=mcr.microsoft.com/dotnet/sdk:5.0
# SHARE_VALUME=dotnet_home_for_$USER
# echo "Create SHARE_VALUME ${SHARE_VALUME}"
# echo "chown share valume to ${UID}"
# # Create User home Volume
# docker volume create $SHARE_VALUME
# docker run  --rm --userns=host \
#     -e HOME=$HOME \
#     -v $SHARE_VALUME:$HOME/ \
#     $imageName chown -R $UID:$UID $HOME/
