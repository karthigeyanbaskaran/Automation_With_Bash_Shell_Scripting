#!/bin/bash
# cnt=1

# until [[ $cnt -eq 3 ]]
# do 
#    echo "hi"
#    cnt=$((cnt+1))
# done 

until systemctl status nginx 1>/dev/null 2>&1
do
    sleep 3
    echo "still nginx is not running"
done 

