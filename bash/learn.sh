#!/bin/bash
echo "Lets do math"
#This is a variable we call a variable by using $ + variable name
 #Number1=9
echo "Please enter a number"
# The read command here is reading the data the user plugs into the command line and will use that number as the variable later in the program
read Number1
Number2=11

# We can do math inside a variable by coding like the example below
total=$((Number1 * Number2))
#we can use a variable and user created text when echo stuff out also
echo $total
echo "your total is "  $total

# echo $Number1
# echo $Number2

#This is an array were we can put multiple items in a variable and call or only certain ones
# When counting in an array remember that the computer starts at 0 and counts up from there like here we would have 0, 1, 2
names=("andrew" "anthony" "ashley")

echo ${names[@]}
echo ${names[2]}
echo ${names[@]: 1:2}

#This is an if and else statment
if (( $Number1 > 5 ))
    then echo "Number is greater than 5"
elif (( $Number1 < 5 ))
then    
     echo "Number is less than 5"
 else
     echo "Number is 5"
  fi
