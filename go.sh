#!/bin/bash
echo "use docker image golan"
docker run -it --rm -u $UID --userns=host -v `pwd`:`pwd` -w `pwd` golang go $*