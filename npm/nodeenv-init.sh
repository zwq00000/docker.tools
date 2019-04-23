#!/bin/bash

#初始化 Nodejs Docker 开发环境

npm config set registry=https://registry.npm.taobao.org
npm config set prefix=~/.npm/global

export PATH=$PATH$;~/.npm/global/bin