#!/usr/bin/bash
#read -rp "Enter your shell type: " myShell
#echo "The shell is: ${myShell}"
#read -p "Enter your scripting: " myScripting
#echo "my scripting is: ${myScripting}"

#read -srp "Enter your password: " myPasswd
#echo
#echo "Your password is: ${myPasswd}"

#read -rp "Enter your value: " 
#echo "your value is: ${REPLY}"


#read -rp "Enter your values: " myVar1 myVar2
#echo "the var1 is: ${myVar1}"
#echo "the var2 is: ${myVar2}"

IFS=':' read -rp "Enter your values: " myVar1 myVar2
echo "the var1 is: ${myVar1}"
echo "the var2 is: ${myVar2}"

