#!/bin/bash
imageName=library/python
echo "Start ${imageName} in Docker shell"

docker run -it --rm --name python_3 \
-v "$PWD":/usr/src/myapp \
-w /usr/src/myapp \
$imageName  $*
