# Your task is very simple here: write a program that uses a for loop to "count mississippily" to five.
#  Having counted to five, 
# the program should print to the screen the final message "Ready or not, here I come!"
import time
mississippi = 1 
for mississippi in range(1,6):
    print(mississippi, "Mississippi")
    time.sleep(1)
    pass
print("Ready or not here  I come")