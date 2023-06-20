# Bob wants to create a guessing number game! 
# Rule 1: Numbers have to be between 1 and 20
# Rule 2: Program must run until the correct number is guessed
# Rule 3: When guessed right, print out how many tries to guess the 
# right number. Example: "Yes! You guessed it in ___ guesses."
# Rule 4: The program will tell you if your number needs to be HIGHER
# or LOWER 
# until the number is guessed correctly and the program ENDS.
# Remeber to import the random function
#Bouns objective can you put it into a loop to make the game end after 3 turns?

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


