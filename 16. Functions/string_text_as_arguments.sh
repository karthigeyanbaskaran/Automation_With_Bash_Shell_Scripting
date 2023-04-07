#!/bin/bash

myFun(){
    echo "${1}"
    echo "${2}"
    echo "${@}"
}

myFun "hi i am shell"  "bash shell"