#!/bin/bash


# $1:linktarget
# $2 source sh
function checkLink(){
    source=$1
    target=$2
    if [ -f $target ]; then
        echo "File $target exists."
    else
        echo "link $target to $source"
        sudo ln $source $target -s
    fi
}

checkLink "go.sh" "/usr/bin/go"

checkLink "yarn.sh" "/usr/bin/yarn"

checkLink "node.sh" "/usr/bin/node"
checkLink "npm.sh" "/usr/bin/npm"
checkLink "npx.sh" "/usr/bin/npx"

checkLink "python.sh" "/usr/bin/python"

checkLink "git.sh" "/usr/bin/git"

checkLink "dotnet.sh" "/usr/bin/dotnet"


