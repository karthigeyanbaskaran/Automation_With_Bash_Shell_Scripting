#!/bin/bash
declare -A myDict
myDict=([name]=docker [version]=1.13.1)

echo "${myDict[@]}"
echo "${myDict[name]}"
echo "${myDict[version]}"
echo "${!myDict[@]}"

unset myDict[name]
echo "${myDict[@]}"
