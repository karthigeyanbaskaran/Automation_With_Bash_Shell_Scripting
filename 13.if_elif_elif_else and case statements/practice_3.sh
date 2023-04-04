#!/bin/bash
#Shell Script to find the status of a given system service
serviceName=${1}
if [[ $# -ne 1 ]] ; then 
    echo "You have to pass input as service name"
    echo "Help to run: "
    echo "<scriptName>  <serviceName>"
    exit 1
fi 
systemctl status ${serviceName} 1>/dev/null 2>&1 
stValue=$?

if [[ ${stValue} -eq 4  ]] ; then 
    echo "service is not deployed"
elif [[  ${stValue} -eq 3  ]] ; then 
    echo "service is not running"
elif [[  ${stValue} -eq 0  ]] ; then 
    echo "Service is running"
else 
    echo "Unknown result"
fi 