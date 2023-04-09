#!/bin/bash

secretFile=/tmp/db.pass
mailTo=ubuntugtest@gmail.com
ECHO=/bin/echo
HOSTNAME=/bin/hostname
MAILX=/bin/mailx
if [[ ! -e ${secretFile} ]] ; then 
    ${ECHO} "File is not exist"
    ${ECHO} "The file ${secretFile} is deleted on this host :$(${HOSTNAME})" | ${MAILX} -s "Alert: Secret File Deleted" ${mailTo}
fi