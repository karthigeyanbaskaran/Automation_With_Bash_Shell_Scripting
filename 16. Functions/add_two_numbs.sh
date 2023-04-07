#!/bin/bash
addition(){
    num1=${1}
    num2=${2}
    result=$((num1 + num2))
    echo "${result}"
    #echo "The addition of ${num1} and ${num2} is : ${result}"    
}


# result1=$(addition 4 7)
# result2=$(addition 1 3)
# result3=$(addition 4 9)

# echo "${result1}"



# input1=${1}  
# input2=${2}
# addition ${input1} ${input2}

addition ${1} ${2}