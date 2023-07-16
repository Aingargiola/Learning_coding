#!/bin/bash
# Given three integers (, , and ) representing the three sides of a triangle, identify whether the triangle is scalene, isosceles, or equilateral.
# If all three sides are equal, output EQUILATERAL.
# Otherwise, if any two sides are equal, output ISOSCELES.
# Otherwise, output SCALENE.
# Input Format
# Three integers, each on a new line.
# Constraints
# The sum of any two sides will be greater than the third.
# Output Format
# One word: either "SCALENE" or "EQUILATERAL" or "ISOSCELES" (quotation marks excluded).


echo -n "How long is each side of the triange " 
read side1
read side2
read side3
if 
[ "$side1" == "$side2" ] && [ "$side2" == "$side3" ] ;
then
echo "the triangle is equlateral"
elif
[ "$side1" == "$side2" ] || [ "$side2" == "$side3" ] || [ "$side1" == "$side3" ] ;
then 
echo "this triangle is Iscoeles"
else 
echo "this triangle is Scalene"
fi