#!/bin/bash
docker run -it --rm --name golang -u $UID --userns=host -v $HOME/go:/go -v $HOME/.cache/go-build:/.cache/go-build -v `pwd`:`pwd` -w `pwd` golang govendor $*