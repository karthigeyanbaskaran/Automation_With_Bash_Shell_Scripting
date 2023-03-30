#!/bin/bash
declare -a myValues
myValues=(4 6 2 7 9)
#echo "${myValues[0]}"
#echo "${myValues[3]}"

#echo "${myValues[@]}"
#echo "${myValues[*]}"

#echo "${myValues[@]:1:2}"
#echo "${!myValues[@]}"
#echo "${#myValues[@]}"

#myValues[2]=45
#echo "${myValues[@]}"

#myValues+=(23)
#myValues+=(47 89)
#echo "${myValues[@]}"

unset myValues[3]
echo "${myValues[@]}"