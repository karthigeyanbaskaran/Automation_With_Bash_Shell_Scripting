#!/bin/bash

read -rp "Enter your pkg Name: " pkgName
osType=$(cat /etc/os-release | grep '^ID=' | cut -d '=' -f2 | tr -d '"'|tr '[A-Z]' '[a-z]')
echo "Installing your pkg: ${pkgName} on ${osType}"
case ${osType} in 
    rhel|centos)   
                if command -v ${pkgName} 1>/dev/null 2>/dev/null ; then 
                    echo "Your Pkg ${pkgName} is already deployed"
                else
                    yum install ${pkgName} -y 
                fi 
                ;;
    ubuntu) 
                if command -v ${pkgName} 1>/dev/null 2>/dev/null ; then 
                    echo "Your Pkg ${pkgName} is already deployed"
                else
                    apt-get install ${pkgName} -y 
                fi
                ;;
    *)      echo "You have to update this script to work with ${osType}"
            ;;
esac
