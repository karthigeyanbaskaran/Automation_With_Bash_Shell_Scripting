#!/bin/bash

# while getopts :vsf: opt
# do 
#     #echo "${opt} ${OPTARG}"
#     case ${opt} in 
#         v)  docker --version ;;
#         s)  systemctl status docker ;; 
#         f)  df -h  ${OPTARG} ;;
#         :)  echo "you missed to pass value for your option" 
#             echo "Usage is : "
#             echo "<scriptName>  [-v] [-s] [-f value]"        
#             ;;
#         \?) echo "You passed invalid option"
#             echo "Usage is : "
#             echo "<scriptName>  [-v] [-s] [-f value]"
#             ;; 
#     esac
# done

while getopts :hu:p: opt
do 
     case ${opt} in 
        u)  userName=${OPTARG} ;;
        p)  passwd=${OPTARG} ;;
        h)
            echo "Usage is : "
            echo "<scriptName>  [-u value] [-p value]"
            exit 0
            ;;         
        :)  echo "you missed value for your option" 
            echo "Usage is : "
            echo "<scriptName>  [-u username] [-p password]"
            ;;         
        \?) 
            echo "You passed invalid option"
            echo "Usage is : "
            echo "<scriptName>  [-u value] [-p value]"
            ;; 
    esac
done 
cat << EOF 
userName: ${userName}
password: ${passwd}
EOF