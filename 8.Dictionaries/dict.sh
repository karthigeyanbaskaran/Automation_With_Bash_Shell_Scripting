#!/bin/bash
declare -A myDict
myDict=([toolName]=docker [toolVer]=1.13.1)
echo "${myDict[@]}"
echo "${!myDict[@]}"
myDict[toolType]=container
echo "${myDict[@]}"

echo "${myDict[toolName]}"

unset myDict[toolVer]

echo "${myDict[@]}"