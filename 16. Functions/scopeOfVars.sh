#!/bin/bash
myShell="bash"

myFun(){
    local myNewShell="ksh"
    echo "your myShell Var: ${myShell}"
    echo "new shell var: ${myNewShell}"
}


echo "out side of a function: your myShell Var: ${myShell}"
myFun
echo "outside of a fun: new shell var: ${myNewShell}"