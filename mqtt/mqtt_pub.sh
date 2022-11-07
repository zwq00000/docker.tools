#!/bin/bash

docker run --rm -it -v `pwd`:`pwd` -w `pwd`  eclipse-mosquitto mosquitto_pub $*
