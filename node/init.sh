#!/bin/bash

UserId=$1
echo UID $UserId

# chown -R $UserId:$UserId ~/

files=('.npmrc' '.yarnrc')

for file in ${files[@]}
do
    echo touch $file
    if [ ! -f $file ];then
        touch $file
    fi
    chown $UserId:$UserId $file
done

folders=('.npm' '.npm/global' '.config/yarn' '.cache' '.cache/yarn')

for folder in ${folders[@]}
do
    echo check folder $folder
    if [ ! -d $folder ];then
        mkdir $folder
    fi
    # echo "chown -R $UserId:$UserId $folder"
    chown -R $UserId:$UserId $folder
done

npm config set prefix $HOME/.npm/global 
npm config set registry https://registry.npm.taobao.org 
ls -lha