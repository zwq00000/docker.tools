#!/bin/bash
echo "Start Ruby in Docker Container ..."
docker run -it --rm --name ruby -u $UID --userns=host -v `pwd`:`pwd` -w `pwd` library/ruby /bin/bash
echo "Exit Ruby Docker Container"
