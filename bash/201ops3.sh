#!/bin/bash
# Condtinal Statment 
# This ops challenges is about conditinal stamtment of if else statments and how they work
# We are going to take a varibale with the number and have the computer tell us if its greater than 5 less than 5 or equals 5
# echo "Enter a number between 1 and 10"
# read number

# if (( $number > 5 ))
#     then
#         echo "Number is greater than 5"
# elif (( $number < 5 ))
#     then
#         echo "Number is less than 5"
# else echo "Number is equal to 5"
# fi


Variables=$Number
echo "Please enter a number."
read Number
sleep 1
echo "Your number is $Number"
sleep 1
 
if (( $Number > 5 ))
    then 
        echo "Your number is greater than 5."
elif (( $Number < 5 ))
    then 
        echo "Your number is less than 5."
else echo "Your number is equal to 5."
fi
sleep 1
echo "Thank you for running my program. Good Bye!"