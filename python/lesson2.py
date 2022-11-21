 # List in python also none as arrays in other language are used to hold muplitple items under one variable
numbers = [10, 5, 7, 2, 1]

print("Original list contents:", numbers)
# Printing original list contents.

numbers[0] = 111
print("New list contents: ", numbers)
# Current list contents.
# copies value of 5th number to second
numbers[1] = numbers[4]
print("New list contents: ", numbers)
print("list length ",len(numbers))
# Using del to remove value from list
del(numbers[1])
print("New list contents: ", numbers)
# Use a negatvive number to count list backwards
print(numbers[-1])
print(numbers[-2])
# add new values to end of list with append
numbers.append(12)
print("New list contents: ", numbers)
# Use insert to add value to certain place in list
numbers.insert(2,23)
print("New list contents: ", numbers)


my_list = [10, 1, 8, 3, 5]
total = 0

for i in my_list:
    total += i

print(total)
# Use the sort command to make list numbers be in order or reverse to go the other way
my_list.sort()
print(my_list)

my_list.reverse()
print(my_list)