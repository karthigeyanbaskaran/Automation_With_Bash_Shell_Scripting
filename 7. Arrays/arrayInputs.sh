#!/bin/bash
declare -a myValues
declare -a myCmdArgs
declare -a myCmdOutArray
myValues=(4 7 2 9)
#echo "${myValues[@]}"
#echo "${myValues[1]}"
#oldIFS=${IFS}
#IFS=':'
#myCmdArgs=( ${@} )
#IFS=${oldIFS}
#echo "${myCmdArgs[@]}"
#echo "${myCmdArgs[0]}"
oldIFS=${IFS}
IFS=':'
myCmdOutArray=( $(cat /etc/passwd | grep 'VRTech') ) #`ls`
IFS=${oldIFS}
echo "${myCmdOutArray[@]}"
echo "${myCmdOutArray[0]}"

