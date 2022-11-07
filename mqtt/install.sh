#!/bin/bash

source_path=$(dirname $(readlink -f $0))
cd $source_path

sed -i -e "/alias mqtt/d" ~/.bash_aliases
echo "alias mqtt_sub='$PWD/mqtt_sub.sh'" >> ~/.bash_aliases
echo "alias mqtt_pub='$PWD/mqtt_pub.sh'" >> ~/.bash_aliases

source ~/.bash_aliases
