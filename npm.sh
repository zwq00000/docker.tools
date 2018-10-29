#!/bin/bash
echo "use docker image library/node:8.12.0"
docker run -it --rm -u $UID --userns=host -e PATH:/home/node/.npm/local/bin -v $HOME:/home/node -v `pwd`:`pwd` -w `pwd` library/node:8.12.0 npm $*

