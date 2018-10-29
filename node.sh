#!/bin/bash
echo "use docker image library/node:8.12.0"
localpath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/node/.npm/local/bin
docker run -it --rm -u $UID --userns=host -e PATH=$localpath --network=bridge -v $HOME:/home/node -v `pwd`:`pwd` -w `pwd` library/node:8.12.0 $*
