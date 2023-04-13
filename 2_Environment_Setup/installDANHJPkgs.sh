#!/bin/bash

yum update -y
yum install epel-release -y
yum update -y
yum install docker  -y
yum install nginx   -y
yum install httpd   -y
yum install java    -y
yum install ansible -y
