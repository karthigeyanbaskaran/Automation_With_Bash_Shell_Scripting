#!/bin/bash
toolName=${1}

if [[ ${#} -ne 1 ]] ; then 
    echo "Script needs input"
    echo "Run this script as: "
    echo "<scriptName> <toolName>"
    exit 1
fi 

# command -v ${toolName} 1>/dev/null 2>&1
# if [[ $? -ne 0 ]]  ; then 
#     echo "The tool: ${toolName} is not exist on this host"
#     exit 2
# fi 

if ! command -v ${toolName} 1>/dev/null 2>&1 ; then 
    echo "The tool: ${toolName} is not exist on this host"
    exit 2
fi 

case ${toolName}  in 
    docker ) 
            docker --version | cut -d ' ' -f3 | tr -d ','
            ;;
    ansible)
            ansible --version | awk 'NR==1' | cut -d ' ' -f2
            ;;
    java)  
            java -version 2>&1 | awk 'NR==1' | cut -d ' ' -f3 | tr -d '"'
            ;;
    nginx )
            nginx -version 2>&1| cut -d '/' -f2 
            ;; 
    *)
            echo "We dont have logic to find the version for this tool: ${toolName}"
            echo "Just update this script to find the version for your tool"
            ;;
esac