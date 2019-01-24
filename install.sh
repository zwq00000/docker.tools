#!/bin/bash
declare -a scripts=("go" "git" "node" "nodejs" "npm" "yarn" "python" "dotnet" "ruby")
echo "Install docker tools "
##********************
## check script link 
## $1 sourch script
## $2 link target
##********************
function checkLink(){
    source=$1
    LINK=$2
    
    if [ -h "$LINK" ]; then
        echo "link $LINK exists."
    else
        echo "link $LINK to $source"
        sudo ln $source $LINK -s
    fi
}

if [ $# -eq 0 ]; then
    echo "Summary: install docker script "
    echo "Example:"
    echo "install.sh go"
    echo ${scripts[*]}
else
    
    for i in ${scripts[@]}
    do
        if [ $1 = ${i} ]; then
            source="${PWD}/${i}.sh"
            target="/usr/bin/${i}"
            checkLink $source $target
        fi
    done
    
fi
