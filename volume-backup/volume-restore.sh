#!/bin/bash
echo "docker volume 备份恢复"
echo "usage: volume-restore <volume-name> [backup-file (.tar.gz)]"

if [ $# < 1 ]; then
    echo "需要指定备份文件名称"
    ls *.tar.gz
    exit 0
fi

volname=$1
echo $#
if [ $# = 2 ];then
    pkgfile=$2
else
    pkgfile=${volname}.tar.gz
fi

echo "还原 ${volname} 从文件 ${pkgfile}..."
if test "$(docker volume inspect $volname -f '{{.Name}}' 2>/dev/null)" = ""  
then
    echo "新建卷 '$volname'"
    docker volume create $volname
fi

docker run --rm -it \
    -v `pwd`:/backup \
    -v $volname:/volumes/$volname \
    -w /volumes/$volname \
    busybox \
    sh -c "tar -zxvf /backup/$pkgfile && du -sh /volumes/$volname"

