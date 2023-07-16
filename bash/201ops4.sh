#!/bin/bash

# Lets create a function in python that adds two number together
# Stretch goal can you do subtraction, multipliaction or division
# You will need to declare two variables

num1=5
num2=7

function add(){
  num3=$(( $num1 + $num2 ))
 echo "The numbers added toegther is $num3"
   
}
add