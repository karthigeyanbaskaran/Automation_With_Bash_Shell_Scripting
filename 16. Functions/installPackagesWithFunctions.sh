#!/bin/bash

if [[ $(id -u) -ne 0 ]] ; then 
    echo "You must be root to run this script"
    exit 1
fi

installPKG(){
    reqPkg=${1}
    if command -v ${reqPkg} 1>/dev/null 2>&1 ; then 
        echo "$(date '+%F %T')  : ${reqPkg} is already deplyed"
    else 
        echo "$(date '+%F %T')  : Installing ${reqPkg}...."
        yum install ${reqPkg} -y
    fi 
}

installPKG ansible 
installPKG httpd
installPKG nginx
installPKG vim
installPKG nc 
installPKG <reqPkg>