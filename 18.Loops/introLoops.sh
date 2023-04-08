#!/bin/bash

statusCheck(){
    echo "Checking the status ..."
    sleep 30
    if  systemctl status nginx 1>/dev/null 2>&1  ; then 
        echo "Nginx is running..."
    else 
        echo "Nginx is stopped"
    fi     
}


if systemctl status nginx 1>/dev/null 2>&1 ; then 
    echo "Nginx is already up and running"
    exit 0
else 
    echo "NGINX is starting...."
    systemctl start nginx 
    echo "Nginx is stated"
    for each in $(seq 4)
    do
        statusCheck       
    done         
        
fi 
