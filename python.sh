#!/bin/bash
docker run -it --rm --name python_3 -v "$PWD":/usr/src/myapp -w /usr/src/myapp library/python python $*
