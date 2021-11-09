#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

echo "alias nodeenv='$PWD/nodeenv.sh'" >> ~/.bash_alias
echo "alias nodejs='$PWD/nodejs.sh'" >> ~/.bash_alias
echo "alias node='$PWD/node.sh'" >> ~/.bash_alias
echo "alias npm='$PWD/npm.sh'" >> ~/.bash_alias
echo "alias yarn='$PWD/yarn.sh'" >> ~/.bash_alias
echo "alias npx='$PWD/npx.sh'" >> ~/.bash_alias
echo "alias npm-runtime='$PWD/npm-runtime.sh'" >> ~/.bash_alias

source ~/.bash_alias

imageName=library/node:12
SHARE_VALUME=npm_home_for_$USER
 # Create User Profile Volume
docker volume create $SHARE_VALUME

docker run  --rm -it --userns=host \
    -e HOME=$HOME \
    -v $SHARE_VALUME:$HOME  \
    -w $HOME \
    $imageName echo "chown  $UID:$UID $HOME/" && \
        chown  $UID:$UID $HOME/ 

# npm config set prefix $HOME/.npm/global 
# npm config set registry https://registry.npm.taobao.org"
