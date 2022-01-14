#!/bin/bash

sed -i -e "/alias htop/d" ~/.bash_alias
echo "alias htop='$PWD/htop.sh'" >> ~/.bash_alias

sed -i -e "/alias grpcui/d" ~/.bash_alias
echo "alias grpcui='$PWD/grpcui.sh'" >> ~/.bash_alias

source ~/.bash_alias
