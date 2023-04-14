#!/bin/bash
if [[ $# -ne 1 ]] ; then 
    echo "This script needs one input "
    echo "Usage: "
    echo "<scriptName> <requiredCommand>"
    exit 1
fi 
reqCmd=${1}
myPass=test123
while IFS=',' read serverName userName 
do 
    echo "Executing the command ${reqCmd} on ${serverName}"
    result=$(sshpass -p ${myPass} ssh -n -E /dev/null -o StrictHostKeyChecking=No ${userName}@${serverName} "${reqCmd}")
    if [[ $? -eq  0 ]] ; then 
        echo "${userName} ${serverName} : ${result}"
    else
        echo "Failed to execute the commadn ${reqCmd} on ${serverName}"
    fi 
done < <(cat remoteServers.txt | awk 'NR != 1 ')