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

case ${stValue} in 
    4)
      echo "service is not deployed"
      ;;
    3)
      echo "service is not running"
      ;;
    0)
      echo "Service is running" 
      ;;
    *) 
      echo "Unknown result"
      ;;
esac 