#!/bin/bash

UID=$1
echo UID $1

chown -R $UID:$UID ~/

if [[ ! -d ~/.npm ]] 
then
    mkdir ~/.npm    
fi

if [[ ! -d ~/.npm/global ]] 
then
    mkdir ~/.npm/global
fi

chown -R $UID:$UID ~/.npm 

npm config set prefix $HOME/.npm/global 
npm config set registry https://registry.npm.taobao.org 
ls -lha