#!/bin/bash
declare -a myPkgs
declare -A devOpsTools
myPkgs=(ansible httpd nginx vim nc)
devOpsTools=([containerTool]=docker   [configurationTool]=ansible [integration]=jenkins)

# echo "${myPkgs[@]}"
# echo "${!myPkgs[@]}"

#Get array values one by one
for eachValue in ${myPkgs[@]} 
do 
   echo "The value is: ${eachValue}"
done 


#Get index values of array one by one
for eachValue in ${!myPkgs[@]} 
do 
   echo "The value is: ${eachValue}"
done 

#Get Array Values using index values
for eachValue in ${!myPkgs[@]} 
do 
   echo "The value is: ${myPkgs[${eachValue}]}"
done 


# echo "${devOpsTools[@]}"
# echo "${!devOpsTools[@]}"

#Get Associative array values
for eachValue in ${devOpsTools[@]}
do 
  echo "value is: ${eachValue}"
done

#Get Associative array keys values 
for eachValue in ${!devOpsTools[@]}
do 
  echo "value is: ${eachValue}"
done

#Get Associative array values using its keys
for eachValue in ${!devOpsTools[@]}
do 
  echo "value is: ${devOpsTools[${eachValue}]}"
done