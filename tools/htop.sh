#!/bin/bash

if [ "$1"="" ];then
    PID=host
else
    PID=container:$1
fi

docker run -it --rm --pid=$PID terencewestphal/htop
