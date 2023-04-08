#!/bin/bash

#Note: always pass file with complete path instead of simply with a file, its a good practice , i missed it while explanning this concept
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

outputFile=${serversListFile}.out

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
