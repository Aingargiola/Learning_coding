#How to print to screen in python 
print("Hissss...")
print("Hello World!")
#Print with no variable cause to skip a line
print()
print("Anthony")
# Starting your print statment on a new line
print("The dog ran across the street.\nHe was chasing a car.")
# As you can see, the end keyword argument determines the characters the print() function sends to the output once it reaches the end of its positional arguments
print("My name is", "Python.  ", end="")
print("Monty Python.")
# Seperates each variable with declared - in this case but could use others like comma or colon
print("My", "name", "is", "Monty", "Python.", sep="-")
print("My", "name", "is", "Monty", "Python.", sep=";")
# prints out with seperation and end statement with * but does not start on new line
print("My", "name", "is", sep="_", end="*")

# Line 19 is a string and Line 20 is an integer 
print("2")
print(2)
# This a boolean uses which is True or False in python
print(True > False)
print(True < False)

print(0.0000000000000000000001)

#Write a one-line piece of code, using the print() function, as well as the newline and escape characters, to match the expected result outputted on three lines.
print("I'm\n" "Learning\n" "Python")

# Using python as a calculator
print(2+2)
# when both ** arguments are integers, the result is an integer, too;
# when at least one ** argument is a float, the result is a float, too.
print(2 ** 2)
print(2 ** 2.)
# An * (asterisk) sign is a multiplication operator.

# A / (slash) sign is a division operator.
# A division sign always lead to a float if needed or not
print(6 / 3)

# A double // removes float and always rounds
print(4 /3)
print(4 // 3)
# The symobol % is called a  modulo and gives the remainder in divison
print(14 % 5)
# 5 goes into 14 twice and gives you a remainder of 4 which is why it printed 4 to the line
print((5 * ((25 % 13) + 100) / (2 * 13)) // 2)
# This equation will complete what is in double parenthsis and then will complete left to right
My_Var = 1
#This is a variable you can use one word or multiple words with an underscore
print(My_Var)
# You can call a varibale like above
# You can use many variable to achieve you goal
Name = "Anthony"
print(My_Var, Name)
print("My Name is " + Name)
# You can declare the variable something else like shown below just remember the code reads line by line going down
Name = "Steve"
print(Name)
Name = Name + " Joe"
print(Name)