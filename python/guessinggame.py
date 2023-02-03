import random
turns = 3
def  guess(x):
    number = random.randint(1, x)
    guess = 0
    turns = 3
    while turns != 0:  
        guess = int(input(f"Enter a number between 1 and {x}:" ))
        if guess > number:
            print(f"Your guess is to high you have turns {turns - 1} left")
            
        elif guess < number:
            print(f"Your guess is low you have turns {turns - 1} left")
        elif guess == number:
            print("your correct")
            break
        turns = turns - 1
        
        
           
            
guess(10)


