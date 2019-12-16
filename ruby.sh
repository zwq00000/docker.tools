#!/bin/bash
imageName=library/ruby
echo "Start Ruby in Docker Container Use image ${imageName} ..."

docker run -it --rm -u $UID --userns=host \
--network=host \
-v `pwd`:`pwd` -w `pwd` \
$imageName /bin/bash

echo "Exit Ruby Docker Container"
