#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

python3=python3

sed -i -e "/alias pip=/d" ~/.bash_alias
echo "alias pip='$PWD/pip.sh'" >> ~/.bash_alias

sed -i -e "/alias python=/d" ~/.bash_alias
echo "alias python='$PWD/python.sh'" >> ~/.bash_alias

shopt -s expand_aliases
source ~/.bash_alias


# init docker container and mount volume
imageName=python:3
Pip_Cache_Volume=python_pip_cache
Python_Lib_Volume=python_lib_volume
echo "Create Pip cache volume ${python_pip_cache}"

# Create User home Volume
docker volume create $Pip_Cache_Volume
docker run  --rm -it --userns=host \
    -e HOME=$HOME \
    -v $Pip_Cache_Volume:$HOME/.cache/pip \
    -v $Python_Lib_Volume:/tmp/lib \
    $imageName chown -R $UID:$UID $HOME/ && cp -r /usr/local/lib / -r

