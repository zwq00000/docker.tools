#!/bin/bash
## user ~/.npmrc and ~/.npm folder
echo "use docker image library/node:8.12.0"
## set host localpath /home/node/.npm/local/bin
localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/node/.npm/local/bin
## map Port default 3000
mapPort=3000
docker run -it --rm -u $UID --userns=host -e PATH=$localpath -p $mapPort:$mapPort -v $HOME:/home/node -v `pwd`:`pwd` -w `pwd` library/node:8.12.0 yarn $*
