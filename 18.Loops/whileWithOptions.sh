#!/bin/bash

# while getopts :v:sf: opt
# do 
#     #echo "${opt} ${OPTARG}"
#     case $opt in 
#         v) ${OPTARG} --version ;;
#         s) systemctl status docker ;;
#         f) df -h ${OPTARG} ;;
#         :) echo "you missed input/argument for your option"
#             echo "usage: "
#             echo "<scriptName> [-v toolName] [-s] [-f  fileSystemName]"
#             ;;        
#         \?) echo "your option is invalid"
#             echo "usage: "
#             echo "<scriptName> [-v] [-s] [-f]"
#             ;;
#     esac
# done 
usage(){
            echo "<scriptName> [-u userNAME]  [-p password]"
            exit 0     
}
while getopts  :hu:p: opt 
do 
    case $opt in 
        u) userName=${OPTARG} ;;
        p) passwd=${OPTARG} ;;
        h) echo "Usage: "
           usage
            ;;
        :) echo "you missed the input/argument for option"
            usage
            ;;
        \?) echo "your option is invalid"
            usage
            ;;                
    esac
done 

if [[ -z ${userName} ]] ; then 
    echo "Failed to get username "
    exit 1
fi 
if [[ -z ${passwd} ]] ; then 
    echo "Failed to get password"
    exit 2
fi 
cat << EOF 
userName: ${userName}
password: ${passwd}
EOF