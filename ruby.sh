#!/bin/bash
echo "use docker image library/ruby:2.3"
docker run -it --rm -u $UID --userns=host -v `pwd`:`pwd` -w `pwd` ruby:2.5 ruby $*

