#!/bin/bash
PS3="Select your service to know the status: "
select option in docker nginx sshd stop
do 
   case $option in 
        docker) systemctl status docker 
                ;; 
        nginx)  systemctl status nginx 
                ;;
        sshd)   systemctl status sshd 
                ;; 
        stop)   break
                ;;
        *)      echo "option is invalid"
                ;;
   esac 
done 