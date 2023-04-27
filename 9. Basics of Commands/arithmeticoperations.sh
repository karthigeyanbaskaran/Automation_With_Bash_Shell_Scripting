#!/bin/bash
#This logic works only for interger numbers
read -rp "Enter your first number: " x
read -rp "Enter you second number: " y
echo "Your Inputs are : ${x} and ${y}"
# sum=$((x+y))
# sub=$((x-y))
# mul=$((x*y))
# div=$((x/y))
# rem=$((x%y))
# xinc=$((++x))
# ydec=$((--y))
# echo -e "sum=${sum}\nsub=${sub}\nmul=${mul}\ndiv=${div}\nrem=${rem}"
# echo "x increment value is: ${xinc}"
# echo "y decrement value is: ${ydec}"

#Below operations are valid for  both integers and floating point numbers
sum=$(bc <<< "${x} + ${y}")
sub=$(bc <<< "${x} - ${y}")
mul=$(bc <<< "${x} * ${y}")
div=$(bc <<< "scale=3; ${x} / ${y}")
rem=$(bc <<< "${x} % ${y}")
xinc=$(bc <<< "${x} + 1" )
ydec=$(bc <<< "${y} - 1" )
echo -e "sum=${sum}\nsub=${sub}\nmul=${mul}\ndiv=${div}\nrem=${rem}"
echo "x increment value is: ${xinc}"
echo "y decrement value is: ${ydec}"
