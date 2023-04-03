#!/bin/bash
#Author : VRTechnologies
#Script is used to read content of a given file
fileName=${1}

if  ! [[ ${#} -eq 1 ]]  ; then 
    echo "You Have to provide input as a file"
    exit 
fi 

if ! [[ -e ${fileName} ]] ; then 
    echo "Given File is not exist" ; 
    exit
fi

if [[ -r  ${fileName} ]]  ; then 
    cat ${fileName} 
else 
    echo "You Dont Have Read Permissions"
fi 
# [[ ${#} -eq 1 ]] || { echo "You Have to provide input as a file" ; exit ; }
# [[ -e ${fileName} ]] || { echo "Given File is not exist" ; exit ; }
# [[ -r  ${fileName} ]] && cat ${fileName} || echo "You Dont Have Read Permissions"
