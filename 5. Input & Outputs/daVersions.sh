#!/usr/bin/bash
dockerVersion=$(docker --version | cut -d ' ' -f3 | tr -d ',')
ansibleVersion=$(ansible --version | awk 'NR==1 {print $2}')

echo "-----------------------"
echo "| ToolName  | Version |"
echo "-----------------------"
echo "| Docker    | ${dockerVersion}  |"
echo "| Ansible   | ${ansibleVersion}  |"
echo "-----------------------"
