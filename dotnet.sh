#!/bin/bash
docker run  --rm -u $UID --userns=host -e HOME=$HOME -v `pwd`:`pwd` -w `pwd`  microsoft/dotnet:latest dotnet $*