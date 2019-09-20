#!/bin/bash

echo "Start openjdk:8-jre env"

docker run  --rm -it -u $UID --userns=host \
-e HOME=/home/dotnet \
--network host \
-v `pwd`:`pwd` -w `pwd` \
openjdk:8-jre /bin/bash  $*