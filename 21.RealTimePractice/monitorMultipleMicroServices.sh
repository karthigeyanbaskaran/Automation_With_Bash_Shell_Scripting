#!/bin/bash
declare -A microServices
microServices=(
        [usersInfoAPI]=http://127.0.0.1:5000/health
        [getServiceIdDetails]=http://127.0.0.1:6000/health
        )

mailTo=vrtechbymn@gmail.com
CURL=/bin/curl
ECHO=/bin/echo
TEE=/usr/bin/tee
MAILX=/usr/bin/mailx 
LOG_FILE=/home/VRTech/log/cronjobs/$(basename $0)_$(date '+%F').log
for eachMicroService in ${!microServices[@]}
do 
    microServiceName=${eachMicroService}
    healthURL=${microServices[${microServiceName}]}
    ${ECHO} "$(date '+%F%T') : Validating the health of the service ${microServiceName} using url ${healthURL} ..." | ${TEE} -a ${LOG_FILE}
    httpStatusCode=$(${CURL} -s -X GET -w "%{http_code}" ${healthURL} -o /dev/null)
    if [[  ${httpStatusCode} -eq 200 ]] ; then 
        ${ECHO} "$(date '+%F%T') :The Micro-Service ${microServiceName} with helath url : ${healthURL} is up and running" | ${TEE} -a ${LOG_FILE}
    else 
        ${ECHO} "$(date '+%F%T') : The Micro-Service ${microServiceName} with helath url : ${healthURL} is not up and running" | ${TEE} -a ${LOG_FILE}
        ${ECHO} "$(date '+%F%T') : The Micro-Service ${microServiceName} with helath url : ${healthURL} is not up and running" | ${MAILX} -s "Alert: Micro-Service Status" ${mailTo}
    fi
done