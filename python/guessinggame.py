import random
turns = 3
def  guess(x):
    number = random.randint(1, x)
    guess = 0
    while guess != number:  
        guess = int(input(f"Enter a number between 1 and {x}:" ))
        if guess > number:
            print(f"Your guess is to high.")
            
        elif guess < number:
            print(f"Your guess is low.")
        
        
           
            
guess(10)
print("Your guess is correct")

