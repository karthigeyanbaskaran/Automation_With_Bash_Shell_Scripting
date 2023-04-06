#!/bin/bash

#This script will send devops tools info to a mail
#Author: VRTech 
#Date: April-4

COMMAND=/bin/command
CUT=/bin/cut
TR=/bin/tr
AWK=/bin/awk
ECHO=/bin/echo
CAT=/bin/cat
MAILX=/bin/mailx
TEE=/bin/tee
LOG_FILE=/home/VRTech/cronJobsLogs/sendDevOpsToosInfo.log
${ECHO} "Validating docker tool" | ${TEE} -a ${LOG_FILE}
if ${COMMAND} -v docker 1>/dev/null 2>&1 ; then 
        DOCKER=$(${COMMAND} -v docker)
        dockerVer=$(${DOCKER} --version | ${CUT} -d ' ' -f3 | ${TR} -d ',') 
        ${ECHO} "DOCKER Version is : ${dockerVer} " | ${TEE} -a ${LOG_FILE}
else
        dockerVer="Not Found"
fi
${ECHO} "Validating ansible tool" | ${TEE} -a ${LOG_FILE}
if ${COMMAND} -v ansible 1>/dev/null 2>&1 ; then 
        ANSIBLE=$(${COMMAND} -v ansible)
        ansibleVer=$(${ANSIBLE} --version | ${AWK} 'NR==1' | ${CUT}  -d ' ' -f2)
        ${ECHO} "ANSIBLE Version is : ${ansibleVer} " | ${TEE} -a ${LOG_FILE}
else 
        ansibleVer="Not Found"
fi 
${ECHO} "Validating java tool" >> ${LOG_FILE}
if ${COMMAND} -v java 1>/dev/null 2>&1 ; then
        JAVA=$(${COMMAND} -v java )
        javaVer=$(${JAVA} -version 2>&1 | ${AWK} 'NR==1' | ${CUT}  -d ' ' -f3 | ${TR} -d '"')
        ${ECHO} "JAVA Version is : ${javaVer} " >> ${LOG_FILE}
else 
        javaVer="Not Found"
fi 
${ECHO} "Validating nginx tool" >> ${LOG_FILE}
if ${COMMAND} -v nginx 1>/dev/null 2>&1 ; then
        NGINX=$( ${COMMAND} -v nginx)
        nginxVer=$(${NGINX} -version 2>&1| ${CUT}  -d '/' -f2) 
        ${ECHO} "NGINX Version is : ${nginxVer} " >> ${LOG_FILE}
else 
        nginxVer="Not Found"
fi 

${ECHO} "ToolName       VersionInfo"
${ECHO} "Docker         ${dockerVer}"
${ECHO} "ansible     ${ansibleVer}"
${ECHO} "java           ${javaVer}"
${ECHO} "nginx          ${nginxVer}"    
             

${CAT} << EOF | ${MAILX} -s "$(${ECHO} -e "DevOps Tools Info on $(hostname)\nContent-Type: text/html")" ubuntugtest@gmail.com
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