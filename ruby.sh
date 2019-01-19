#!/bin/bash
echo "Start Ruby from docker"
echo "docker run -it --rm --name ruby -v `pwd`:`pwd` -w `pwd` library/ruby /bin/bash"
docker run -it --rm --name ruby -v `pwd`:`pwd` -w `pwd` library/ruby /bin/bash