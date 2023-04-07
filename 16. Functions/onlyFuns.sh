#!/bin/bash

validateTool(){
    if  command -v ${1} 1>/dev/null 2>&1  ; then 
        echo "Intalled, Path: $(command -v ${1})"
        return 0
    else
        echo "Not Installed"
        return 1
    fi
}