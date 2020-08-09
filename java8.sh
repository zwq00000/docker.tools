#!/bin/bash

imageName=library/node:12
echo "Start ${imageName} env"

docker run  --rm -it -u $UID:$UID --userns=host \
-e HOME=/home/dotnet \
--network host \
-v `pwd`:`pwd` -w `pwd` \
$imageName /bin/bash  $*