#!/bin/bash
userName=ec2-user
serverName=54.234.43.144
PASSWORD=test123
reqCmd='df -h'
expect -c "
        spawn ssh -o StrictHostKeyChecking=No ${userName}@${serverName} ${reqCmd}
        expect { 
            "*password:*" { send $PASSWORD\r ; interact }
        }
        exit
        "


# expect -c "
#         spawn scp -o StrictHostKeyChecking=No readCmd.sh ${userName}@${serverName}:/tmp/.
#         expect { 
#             "*password:*" { send $PASSWORD\r ; interact }
#         }
#         exit
#         "        