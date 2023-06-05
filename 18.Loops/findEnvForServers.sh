#!/bin/bash

serversListFile=${1}


if [[ $# -ne 1 ]] ; then 
    echo "This script needs one input , that is file name"
    echo "Usage:"
    echo "<scriptName>  <serverListFile>"
    exit 1
fi


if [[ -e ${serversListFile} ]] ; then 
    echo "Input File is valid file"
else 
    echo "Input file ${serversListFile} is not exist on this host"
    exit 2
fi 

if [[ ! -s ${serversListFile} ]] ; then  #checking file is empty or not (-s) size
    echo "File is empty"
    exit 3
fi 

outputFile=$(basename ${serversListFile}).out  #why basenmae means suppose you pass path like /tmp/server.txt it create the file at current dir. not to /tmp/server.out

if [[ -e ${outputFile} ]] ; then 
    echo "${outputFile} is already there. now we are deleting it to write new content"
    rm ${outputFile}
fi 
echo "serverName   : environment" | tee -a  ${outputFile}
for eachServer in $(cat ${serversListFile})
do 
   serverName=$(echo ${eachServer} | cut -d '.' -f1)
   environment=$(echo ${eachServer} | cut -d '.' -f2)
   echo "${serverName} : ${environment}" | tee -a  ${outputFile}
done 
