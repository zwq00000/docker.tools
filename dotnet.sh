#!/bin/bash

echo "use docker image microsoft/dotnet:2.1-sdk"

docker run  --rm -u $UID --userns=host -e HOME=/tmp -v `pwd`:`pwd` -w `pwd`  microsoft/dotnet:2.1-sdk dotnet $*