#!/bin/bash
LS=/bin/ls
DATE=/bin/date
ECHO=/bin/echo
MAILX=/bin/mailx
AWK=/bin/awk
LogLocToMonitor=/home/VRTech/log/applicationLogs
mailTo=vrtechbymn@gmail.com
subject="Alert: Application Log Monitoring Status"


if [[ ! -d ${LogLocToMonitor} ]] ; then
    ${ECHO} "Your Log dir is ${LogLocToMonitor} is not existing" | ${mailx} -s "${subject}"  ${mailTo}
    exit 1 
fi 

latestFile=$(${LS} -lt ${LogLocToMonitor} | ${AWK} 'NR==2{print $NF}')

if [[ -z ${latestFile} ]] ; then
    ${ECHO} "No Files generated " | ${MAILX} -s "${subject}"  ${mailTo}
    exit 2
fi 
creationTime=$(${DATE} -r ${LogLocToMonitor}/${latestFile} '+%s')
prestTime=$(${DATE}  '+%s')

ageInSec=$(( prestTime - creationTime ))
ageInHrs=$(( ageInSec / 3600 ))

if [[ ${ageInHrs} -gt 24 ]] ; then 
    ${ECHO} "Application is not generating logs for more than 24hrs"  | ${mailx} -s "${subject}"  ${mailTo}
fi 










