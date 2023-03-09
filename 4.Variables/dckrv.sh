#!/usr/bin/bash
dockerVersion=$(docker --version | cut -d ' ' -f3 | tr -d ',')
echo ${dockerVersion}

newVar=`docker --version | cut -d ' ' -f3 | tr -d ','`
echo ${newVar}