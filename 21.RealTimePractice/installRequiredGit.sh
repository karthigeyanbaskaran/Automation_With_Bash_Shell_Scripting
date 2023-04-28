#!/bin/bash
LOG_FILE=/tmp/$(basename $0)_$(date '+%F').log
INFO(){
    echo "$(date '+%F %T') : INFO     : ${*}" | tee -a ${LOG_FILE}
}
WARRNING(){
    echo "$(date '+%F %T') : WARRNING : ${*}" | tee -a ${LOG_FILE}
}
ERROR(){
    echo "$(date '+%F %T') : ERROR    : ${*}" | tee -a ${LOG_FILE}
}


if [[ $(id -u) -ne 0 ]] ; then 
    WARRNING "You Must Run This Script From Root User Only"
    exit 1
fi 
DownloadsPath=/root/Downloads
if [[ ! -e ${DownloadsPath} ]] ; then 
    mkdir -p ${DownloadsPath}
fi 

read -rp "Enter your required git version: " reqGitVer
if command -v git 1>/dev/null 2>/dev/null ; then 
    gitVerOnHost=$(git --version | awk '{print $NF}')
    if [[ ${reqGitVer} == ${gitVerOnHost} ]] ; then 
        INFO "Already , this git version ${reqGitVer} is deployed on this host"
        exit 0
    fi 
fi
INFO "Your required git version is: ${reqGitVer}"
yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker 1>>${LOG_FILE} 2>>${LOG_FILE}
if [[ $? -ne 0 ]] ; then 
    ERROR "Failed to install required packges for git"
    exit 2
fi 
cd ${DownloadsPath}
INFO "Downloading git-${reqGitVer}.tar.gz...."
wget 	https://mirrors.edge.kernel.org/pub/software/scm/git/git-${reqGitVer}.tar.gz 1>>${LOG_FILE} 2>>${LOG_FILE}
if [[ $? -ne 0 ]] ; then 
    ERROR "Failed to Download your required git version ${reqGitVer}"
    exit 3
fi 
INFO "Extracting git-${reqGitVer}.tar.gz...."
tar xvzf "git-${reqGitVer}.tar.gz" 1>>${LOG_FILE} 2>>${LOG_FILE}
if [[ $? -ne 0 ]] ; then 
    ERROR "Failed to extract git-${reqGitVer}.tar.gz"
    exit 4
fi 
cd git-${reqGitVer}

INFO "Running build step ..."
make prefix=/usr/local all 1>>${LOG_FILE} 2>>${LOG_FILE}
if [[ $? -ne 0 ]] ; then 
    ERROR "Failed to run the build step"
    exit 5
fi 

INFO "Installing git ......"
make prefix=/usr/local install  1>>${LOG_FILE} 2>>${LOG_FILE}
if [[ $? -ne 0 ]] ; then 
    ERROR "Failed to install git"
    exit 6
fi 
yum remove -y git 1>>${LOG_FILE} 2>>${LOG_FILE}

INFO "Successfully Installed your required git ${reqGitVer}"
git --version
