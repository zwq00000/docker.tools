#!/bin/bash
###################
##  dotnet sdk env
###################
echo "use docker image microsoft/dotnet:2.2-sdk"

docker run  --rm -it --name dotnetenv \
-u $UID --userns=host \
-p 5000:5000 \
-network host \
-e HOME=/tmp \
-v `pwd`:`pwd` -w `pwd` \
microsoft/dotnet:2.2-sdk /bin/bash $*