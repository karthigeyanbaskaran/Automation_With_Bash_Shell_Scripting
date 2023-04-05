#!/bin/bash
#This script is to send all devops tools (docker,java,nginx and ansible) versions info to mail
#Author: VRTechnologies

if command -v docker 1>/dev/null 2>&1 ; then 
        dockerVer=$(docker --version | cut -d ' ' -f3 | tr -d ',') 
else
        dockerVer="Not Found"
fi
if command -v ansible 1>/dev/null 2>&1 ; then 
        ansibleVer=$(ansible --version | awk 'NR==1' | cut -d ' ' -f2)
else 
        ansibleVer="Not Found"
fi 

if command -v java 1>/dev/null 2>&1 ; then
        javaVer=$(java -version 2>&1 | awk 'NR==1' | cut -d ' ' -f3 | tr -d '"')
else 
        javaVer="Not Found"
fi 

if command -v nginx 1>/dev/null 2>&1 ; then
        nginxVer=$(nginx -version 2>&1| cut -d '/' -f2) 
else 
        nginxVer="Not Found"
fi 

echo "ToolName       VersionInfo"
echo "Docker         ${dockerVer}"
echo "ansible     ${ansibleVer}"
echo "java           ${javaVer}"
echo "nginx          ${nginxVer}"    
             

cat << EOF | mailx -s "$(echo -e "DevOps Tools Info on $(hostname)\nContent-Type: text/html")" ubuntugtest@gmail.com
<!DOCTYPE html>
<html>

<head>
    <title>
         Automation By VRTechnologies
    </title>
</head>

<body>
    <h2>Please Find Below Table For DevOps Tools Versions </h1>
    <table border="1">
        <tr>
            <th>ToolName</th>
            <th>Version</th>
        </tr>
        <tr>
            <td>Docker</td>
            <td>${dockerVer}</td>
        </tr>
        <tr>
            <td>ansible</td>
            <td>${ansibleVer}</td>
        </tr>
        <tr>
            <td>java</td>
            <td>${javaVer}</td>
        </tr>
        <tr>
            <td>nginx</td>
            <td>${nginxVer}</td>
        </tr>
    </table>
</body>

EOF
