#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

sdk2=microsoft/dotnet:2.2-sdk
sdk3=mcr.microsoft.com/dotnet/core/sdk:3.1
sdk5=mcr.microsoft.com/dotnet/sdk:5.0
sdk6=mcr.microsoft.com/dotnet/sdk:6.0

sed -i -e "/alias dotnet/d" ~/.bash_alias
echo "alias dotnetshell='export DOTNET_SDK=$sdk5 && $PWD/dotnetshell.sh'" >> ~/.bash_alias
echo "alias dotnet='export DOTNET_SDK=$sdk5 && $PWD/dotnet.sh'" >> ~/.bash_alias

echo "alias dotnetshell2='export DOTNET_SDK=$sdk2 && $PWD/dotnetshell.sh'" >> ~/.bash_alias
echo "alias dotnetshell3='export DOTNET_SDK=$sdk3 && $PWD/dotnetshell.sh'" >> ~/.bash_alias
echo "alias dotnetshell5='export DOTNET_SDK=$sdk5 && $PWD/dotnetshell.sh'" >> ~/.bash_alias
echo "alias dotnetshell6='export DOTNET_SDK=$sdk6 && $PWD/dotnetshell.sh'" >> ~/.bash_alias
echo "alias dotnet2='export DOTNET_SDK=$sdk2 && $PWD/dotnet.sh'" >> ~/.bash_alias
echo "alias dotnet3='export DOTNET_SDK=$sdk3 && $PWD/dotnet.sh'" >> ~/.bash_alias
echo "alias dotnet5='export DOTNET_SDK=$sdk5 && $PWD/dotnet.sh'" >> ~/.bash_alias
echo "alias dotnet6='export DOTNET_SDK=$sdk6 && $PWD/dotnet.sh'" >> ~/.bash_alias


echo "alias dotnet-tools='$PWD/dotnet-tools.sh'" >> ~/.bash_alias
echo "alias dotnet-counters='$PWD/dotnet-counters.sh'" >> ~/.bash_alias

source ~/.bash_alias

# init docker container and mount volume
imageName=$sdk5
SHARE_VALUME=dotnet_home_for_$USER
echo "Create SHARE_VALUME ${SHARE_VALUME}"
echo "chown share valume to ${UID}"
# Create User home Volume
docker volume create $SHARE_VALUME
docker run  --rm --userns=host \
    -e HOME=$HOME \
    -v $SHARE_VALUME:$HOME/ \
    $imageName chown -R $UID:$UID $HOME/
