#!/bin/bash
microServiceName="usersInfoAPI"
healthURL=http://127.0.0.1:5000/health
mailTo=vrtechbymn@gmail.com
CURL=/bin/curl
ECHO=/bin/echo
TEE=/usr/bin/tee
MAILX=/usr/bin/mailx 
LOG_FILE=/home/VRTech/log/cronjobs/$(basename $0)_$(date '+%F').log
${ECHO} "Validating the health of the service ${microServiceName} using url ${healthURL} ..." | ${TEE} -a ${LOG_FILE}
httpStatusCode=$(${CURL} -s -X GET -w "%{http_code}" ${healthURL} -o /dev/null)
if [[  ${httpStatusCode} -eq 200 ]] ; then 
    ${ECHO} "The Micro-Service ${microServiceName} with helath url : ${healthURL} is up and running" | ${TEE} -a ${LOG_FILE}
else 
    ${ECHO} "The Micro-Service ${microServiceName} with helath url : ${healthURL} is not up and running" | ${TEE} -a ${LOG_FILE}
    ${ECHO} "The Micro-Service ${microServiceName} with helath url : ${healthURL} is not up and running" | ${MAILX} -s "Alert: Micro-Service Status" ${mailTo}
fi
