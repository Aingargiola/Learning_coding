# You are going to write a program that calculates the sum of all the even numbers from 1 to 100. Thus, the first even number would be 2 and the last one is 100:

# i.e. 2 + 4 + 6 + 8 +10 ... + 98 + 100

# Important, there should only be 1 print statement in your console output. It should just print the final total and not every step of the calculation.


#Write your code below this row 👇
even_sum = 0
for nums in range (2, 101, 2):
    print(nums)
    even_sum += nums
print(f"Final total is {even_sum}")
