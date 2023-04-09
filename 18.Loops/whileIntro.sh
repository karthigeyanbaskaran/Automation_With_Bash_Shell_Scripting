#!/bin/bash

# for (( ; ; ))
# do 
#     echo "hi"
# done 

# while :
# do 
#    echo "hi"
# done 



# num=1
# while :
# do
#    echo "hi"
#    num=$((num+1)) #5
#    if [[ $num -eq  5  ]] ; then 
#         break
#    fi 
#    sleep 1
# done 

cnt=1

while  [[ $cnt -le 4 ]] 
do 
    echo "hi"
    cnt=$((cnt+1)) #2 #3 #4 #5
done 