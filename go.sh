#!/bin/bash
echo "Start golang in Docker Container ..."
docker run -it --rm --name golang -u $UID --userns=host -v $HOME/go:/go -v $HOME/.cache/go-build:/.cache/go-build -v `pwd`:`pwd` -w `pwd` golang go $*
echo "Exit golang Docker Container"
