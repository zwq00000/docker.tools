#!/bin/bash

if [ $# = 0 ]; then
    echo "需要指定卷名称"
    docker volume ls --format '{{.Name}}'
    exit 0
fi

volname=$1

tag=$(date +"%Y%m%d")

if test "$(docker volume inspect $volname -f '{{.Name}}' 2>/dev/null)" = ""  
then
    echo "卷 ${volname} 不存在"
else
    echo "备份 ${volname} ..."

    docker run --rm -it \
        -v `pwd`:/backup \
        -v $volname:/volumes/$volname:ro \
        -w /volumes/$volname \
        busybox \
        sh -c "du -sh /volumes/$volname &&
        tar -zcvf /backup/${volname}.${tag}.tar.gz ."
fi



