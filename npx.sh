#!/bin/bash
docker run -it --rm -u $UID:$UID --userns=host -v $HOME:/home/node -v `pwd`:`pwd` -w `pwd` node npx $*