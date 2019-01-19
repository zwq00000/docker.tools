#!/bin/bash
echo "Start Ruby in Docker Container ..."
docker run -it --rm --name ruby -v `pwd`:`pwd` -w `pwd` library/ruby /bin/bash
echo "Exit Ruby Docker Container"