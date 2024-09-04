# Write a multi-line comment with your name, favorite food, and dream job on 3 different lines.
print("My name is Anthony, my favorite food is pizza, and my dream job is ")
# assign 5 different data types to 5 different variables. At least one datatype must be a string.
a = "Dog"
b = int(15)
c = float(1.432)
d = "Cat"
e = int(14)
# print the length of your string.
print(len(a))


# create a new variable called savvy, and assign it the string with this phrase "Learning Python is Awesome!"
savvy = "Learning Data Analytics and Python is Awesome!"
# return a range of characters that slices the above string from the beginning of "ing" up to before "and"
print(savvy[5:15])
# Replace "Awesome" with "great" in the string
new_savvy = savvy.replace("Awesome", "great")
print(new_savvy)
# Test and print the savvy string to see it contains "Python"
print(savvy)
# Create and assign 3 more variables called name, age and length using the multi-variable naming method.
name, age, lenght = "Anthony", 34, 6

# Format a new string called 'miniBio' using variables in curly brackets to complete this phrase... "Hi my name is (name), I am (tall) and (so) old today."
print(f"Hi my name is {name}, I am {lenght} feet tall, and {age} years old.")
# print 'miniBio'
# cast and print the age variable to a float.
print(float(age))

# Create a list of at least 5 elements of mixed data types
# replace a part of it with something else
# append or insert several more items to the list
# find and print the length of the list
# slice a sub-section of the 1st list, and save it to a different 2nd list
# print the 2nd list
# extend your original list with the 2nd list sliced above
# Create a new list called "simList" containing at least 5 elements of the same data type, either string, integer, float, or Boolean.
# sort "simList", and print the list
# copy the "simList" list to another 3rd list
# add the 2nd and 3rd lists together into a 4th list

grocery_list = ["eggs", "meat", "pizza", "bread", "milk"]
grocery_list[2] = "Pasta"
grocery_list.append("Chicken")
print(grocery_list)
print(len(grocery_list))
middle_index = 3
first_grocery = grocery_list[:middle_index]
second_grocery = grocery_list[middle_index:]
print(second_grocery)
new_list = first_grocery + second_grocery
print(new_list)
sim_list = [1, 2, 3, 5, 6, 7, 8 ]
sim_list.sort()
new_sim_list = sim_list
final_list = second_grocery + sim_list + new_sim_list
print(final_list)