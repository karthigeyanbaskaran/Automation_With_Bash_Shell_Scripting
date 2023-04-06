#!/bin/bash
cmdInput=${1}
conversion(){
    echo "${@}"
    return 2
    # input=${1}
    # inputU=${input^^}
    # echo "Input is: ${input} and converted input is: ${inputU}"
}

funOut=$(conversion ${cmdInput} asdf  asdf as )
echo "${?}"
#echo "${funOut}"



