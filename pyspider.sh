#!/bin/bash

docker run --rm -it --network host -v pyspider_data:/opt/pyspider/data  saibaster/pyspider
