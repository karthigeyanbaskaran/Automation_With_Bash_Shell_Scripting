#!/bin/bash
pkgName=${1}
userId=$(id -u)

if [[ $# -ne 1 ]] ; then 
    echo "Please pass input as some package name "
    exit 1
fi 
#  && { echo "You are not the root user. Please run this script from root" ; exit ; } 
if [[ ${userId} -ne 0 ]] ; then 
   echo "You are not the root user. Please run this script from root"
   exit 2
fi 
if command -v ${pkgName} 1>/dev/null 2>&1 ; then 
    echo "Your Pkg ${pkgName} is already deployed"
else 
    yum install ${pkgName} -y 1>/dev/null 2>&1
    yumExitSt=$?
    if [[ ${yumExitSt} -eq 0  ]] ;
    then 
       echo "Package is installed successfully"
    else 
        echo "Installation is failed"
    fi 
fi




