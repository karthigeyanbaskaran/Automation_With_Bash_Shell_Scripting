#!/bin/bash
gitVerSourceUrl=https://mirrors.edge.kernel.org/pub/software/scm/git/
downFile=gitVersionInfo_$(date '+%F%T')
echo "Downloading versions html page......"
httpCode=$(curl -s -w '%{http_code}' ${gitVerSourceUrl} -o ${downFile})

if [[ ${httpCode} -eq 200 ]] ; then 
    echo "Successfully downloaded versions info"
    latestVer=$(grep -oE '\-[0-9]+\.[0-9]+\.[0-9]+\.tar.gz' ${downFile} | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | sort --version-sort --field-separator=. | uniq | tail -1)
    echo "The latest git version is: ${latestVer}"
    
else 
    echo "Failed to get latest version info"
fi 
