#!/bin/bash
PS3="Enter your option : "
select opt in add sub mul div 
do 
    echo "Your Option is: ${opt}"
    case $opt in 
        add)
                read -rp "Enter your first number: " num1
                read -rp "Enter your second number: " num2
                result=$((num1 + num2))
                echo "The addition of ${num1} and ${num2} is: ${result}"
                ;;
        sub)
                read -rp "Enter your first number: " num1
                read -rp "Enter your second number: " num2
                result=$((num1 - num2))
                echo "The subtraction of ${num1} and ${num2} is: ${result}"
                ;;
        mul)
                read -rp "Enter your first number: " num1
                read -rp "Enter your second number: " num2
                result=$((num1 * num2))
                echo "The multiplication of ${num1} and ${num2} is: ${result}"
                ;;
        div)
                read -rp "Enter your first number: " num1
                read -rp "Enter your second number: " num2
                if [[ $num2 -eq 0 ]] ; then 
                    echo "The division of ${num1} is not possible with ${num2}"
                    continue
                fi                
                result=$((num1 / num2))
                echo "The division of ${num1} with ${num2} is: ${result}"
                ;;                                                
        *)
                echo "Invalida Option, try again"
                ;;
    esac
done 