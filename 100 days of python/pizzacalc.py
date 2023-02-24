# Congratulations, you've got a job at Python Pizza. Your first job is to build an automatic pizza order program.

# Based on a user's order, work out their final bill.

# Small Pizza: $15

# Medium Pizza: $20

# Large Pizza: $25

# Pepperoni for Small Pizza: +$2

# Pepperoni for Medium or Large Pizza: +$3

# Extra cheese for any size pizza: + $1

# 🚨 Don't change the code below 👇
print("Welcome to Python Pizza Deliveries!")
size = input("What size pizza do you want? S, M, or L ")
add_pepperoni = input("Do you want pepperoni? Y or N ")
extra_cheese = input("Do you want extra cheese? Y or N ")
# 🚨 Don't change the code above 👆

#Write your code below this line 👇
total = 0


if size == "L":
    total += 25
elif size == "M":
    total += 20
elif size == "S":
    total += 15
else:
    print("Wrong input") 

if add_pepperoni == "Y" and size == "L" or "M":
    total += 3
elif add_pepperoni == "Y" and size == "S":
    total += 2
else:
    print("No pepperoni added")

if extra_cheese == "Y":
    total += 1
else:
    print("no extra cheese")


print(f"Your pizza will cost ${total}")