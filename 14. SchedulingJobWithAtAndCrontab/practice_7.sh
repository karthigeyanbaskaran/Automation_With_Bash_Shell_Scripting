#!/bin/bash
COMMAND=/bin/command
AWK=/bin/awk
CUT=/bin/cut
MAILX=/bin/mailx
CAT=/bin/cat
ECHO=/bin/echo
if ${COMMAND} -v docker 1>/dev/null 2>&1 ; then 
        DOCKER=$(${COMMAND} -v docker)
        dockerVer=$(${DOCKER} --version | ${CUT} -d ' ' -f3 | tr -d ',') 
else
        dockerVer="Not Found"
fi
if ${COMMAND} -v ansible 1>/dev/null 2>&1 ; then 
        ANSIBLE=$(${COMMAND} -v ansible)
        ansibleVer=$(${ANSIBLE} --version | ${AWK} 'NR==1' | ${CUT} -d ' ' -f2)
else 
        ansibleVer="Not Found"
fi 

if ${COMMAND} -v java 1>/dev/null 2>&1 ; then
        JAVA=$(${COMMAND} -v java)
        javaVer=$(${JAVA} -version 2>&1 |  ${AWK} 'NR==1' | ${CUT} -d ' ' -f3 | tr -d '"')
else 
        javaVer="Not Found"
fi 

if ${COMMAND} -v nginx 1>/dev/null 2>&1 ; then
        NGINX=$(${COMMAND} -v nginx)
        nginxVer=$(${NGINX} -version 2>&1| ${CUT} -d '/' -f2) 
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
