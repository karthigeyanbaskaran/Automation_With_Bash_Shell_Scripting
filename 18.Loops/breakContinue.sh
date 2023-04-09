#!/bin/bash
# echo "WE ARE WORKING ON BREAK AND CONTINUE"

# for eachNum in 3 5 6 9  8
# do  
#     if [[ ${eachNum} -eq 9 ]]; then 
#         break 
#     fi 
#     echo "The number is: ${eachNum}"
# done

# echo "This is from outside of the loop"


echo "WE ARE WORKING ON BREAK AND CONTINUE"

for eachNum in 3 5 6 9  8
do  
    if [[ ${eachNum} -eq 9 ]]; then 
        continue
        echo "here continue statemnt" 
    fi 
    echo "The number is: ${eachNum}"
done

echo "This is from outside of the loop"