#!/bin/bash
docker run -ti --rm --userns=host --env HOME -v $HOME/.ssh:$HOME/.ssh -v $HOME:$HOME -v `pwd`:`pwd` -w `pwd` alpine/git $*
# docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git $*

