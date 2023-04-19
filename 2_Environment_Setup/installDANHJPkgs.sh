#!/bin/bash
osDistro=$(cat /etc/os-release  | grep '^ID=' | cut -d '"' -f2)
if [[ ${osDistro,,} != centos ]] ; then 
    echo "Distribution is not CentOS so script wontwork here "
fi 

yum update -y
yum install -y epel-release
yum update -y
yum install wget -y
yum install nginx   -y
yum install httpd   -y
yum install java    -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum update -y 
yum install docker-ce -y 


VERSION_ID=$(cat /etc/os-release  | grep '^VERSION_ID' |cut -d '"' -f2)
case ${VERSION_ID} in 
    7)
        cd /tmp/
        wget https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz
        tar xzf Python-3.7.9.tgz
        cd Python-3.7.9
        yum install gcc openssl-devel bzip2-devel libffi-devel -y
        ./configure --enable-optimizations
        sudo make altinstall
        sudo ln -sfn /usr/local/bin/python3.7 /usr/bin/python3
        sudo ln -sfn /usr/local/bin/pip3.7 /usr/bin/pip3
        pip3 install --upgrade pip
        pip3 install ansible==2.9.27
        ;; 
    9)
        yum install python3-pip -y
        pip3 install --upgrade pip
        pip3 install ansible==2.9.27

        ;;
    *) echo "OS Release Version is Known, so cant install ansible" ;;
esac

clear

echo "Finding the installed tools version info"
echo '========================================>'
sleep 3
echo "docker --version"
echo "---------------->"
docker --version
echo "---------------->"
echo "ansible --version"
echo "---------------->"
ansible --version
echo "---------------->"
echo "java -version"
echo "---------------->"
java -version
echo "---------------->"
echo 'nginx -version'
echo "---------------->"
nginx -version
echo "---------------->"
echo 'httpd -version'
echo "---------------->"
httpd -version
echo "---------------->"

echo "Your OS Info: "
cat /etc/redhat-release
