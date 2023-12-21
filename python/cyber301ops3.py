# Scenario
# Using one of the comparison operators in Python, write a simple  program that takes the parameter n as input,
#  which is an integer, and prints False if n is less than 100, and True if n is greater than or equal to 100.


# Test your code using the data we've provided for you.

n = int(input("Enter a number between 1 and 1000\n"))
if n > 100: 
    print(f"{n} is greater than 100 so True")
elif n < 100:
    print(f"{n} is less than 100 so False")
else: 
    print(f"{n} is equal to {n}")