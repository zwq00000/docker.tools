#!/bin/bash
echo "Start Ruby in Docker Container ..."

docker run -it --rm -u $UID --userns=host \
--network=host \
-v `pwd`:`pwd` -w `pwd` \
library/ruby /bin/bash

echo "Exit Ruby Docker Container"
