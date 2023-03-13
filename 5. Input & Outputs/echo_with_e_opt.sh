#!/usr/bin/bash
#!/usr/bin/bash
dockerVersion=$(docker --version | cut -d ' ' -f3 | tr -d ',')
ansibleVersion=$(ansible --version | awk 'NR==1 {print $2}')

echo -e "${dockerVersion}\n${ansibleVersion}"
echo -e "${dockerVersion}\t${ansibleVersion}"
echo -e "${dockerVersion}\v${ansibleVersion}"