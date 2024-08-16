#!/bin/bash

# Lets create a function in python that adds two number together
# Stretch goal can you do subtraction, multipliaction or division
# You will need to declare two variables

num1=6
num2=3

function add(){
  num3=$(( $num1 + $num2 ))
 echo "The numbers added toegther is $num3"
   
}
add

function div(){
  num4=$(( $num3 * $num1 ))
  echo "The new total is $num4"
}
div

add




echo "Enter 2 numbers to divide"
read num1
read num2
#Check if denominator is not zero to avoid division by zero
if [$num2 = 0]
   then
   echo "Error: Division by zero is not allowed."
function divide(){
    result=$(( $num1 / $num2))
    echo $result
}
divide