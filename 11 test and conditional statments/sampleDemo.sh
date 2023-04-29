#!/bin/bash
echo "USER=$USER" 
echo "Today's Date: $(date)"
pwd
echo "${myValue}"
if command -v nginx 1>/dev/null 2>/dev/null ; then
    echo 'nginx is installed'
fi