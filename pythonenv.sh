#!/bin/bash

echo "Use docker image library/python"

docker run -it --rm -u $UID --userns=host \
-e PATH=$localpath \
--network=host \
-v `pwd`:`pwd` -w `pwd` \
library/python  \
/bin/bash $*
