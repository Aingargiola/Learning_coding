# Your task is very simple here: write a program that uses a for loop to "count mississippi" to five.
#  Having counted to five, 
# the program should print to the screen the final message "Ready or not, here I come!"
import time

#Start code below this line:

print(time.strftime("%Y-%m-%d %H:%M:%S"))
mississippi = 1 
for mississippi in range(1,6):
    print(mississippi, "Mississippi")
    time.sleep(1)
print("Ready or not here  I come")
print(time.ctime())



# while mississippi < 6:
#     print(mississippi, "Mississippi")
#     time.sleep(1)
#     mississippi += 1
# print("Ready or not here I come!")