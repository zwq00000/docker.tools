#!/bin/bash
docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git $*

