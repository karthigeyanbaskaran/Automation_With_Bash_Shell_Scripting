#!/bin/bash
declare -a services
services=(sampleRESTApi.py service2 service3    )
mailTo=vrtechbymn@gmail.com
PS=/usr/bin/ps
GREP=/bin/grep
WC=/usr/bin/wc
ECHO=/bin/echo
HOSTNAME=/usr/bin/hostname
MAILX=/usr/bin/mailx 
TEE=/usr/bin/tee
LOG_FILE=/home/VRTech/log/cronjobs/$(basename $0)_$(date '+%F').log
for serviceName in ${services[@]}
do 
    pc=$(${PS} -ef | ${GREP} ${serviceName} | ${GREP} -v grep | grep -v ${0}| ${WC} -l)
    ${ECHO} "Process count value for the service ${serviceName} is : ${pc}" | ${TEE} -a ${LOG_FILE}
    if [[ ${pc} -eq 0 ]] ; then
        ${ECHO} "Service ${serviceName} is not up and running on host: $(${HOSTNAME}) " | ${TEE} -a ${LOG_FILE}
        ${ECHO} "Service ${serviceName} is not up and running on host: $(${HOSTNAME})"  | ${MAILX} -s "Alert Service ${serviceName} status" ${mailTo}
    else
        ${ECHO} "Service ${serviceName} is up and running" | ${TEE} -a ${LOG_FILE}
        ${ECHO} "Service ${serviceName} is up and running"
    fi
done