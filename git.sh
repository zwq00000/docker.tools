#!/bin/bash
docker run -it --rm -u $UID --userns=host --env HOME -v $HOME:$HOME -v `pwd`:`pwd` -w `pwd` golang  /usr/bin/git $*