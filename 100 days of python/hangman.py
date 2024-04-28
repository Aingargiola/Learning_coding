
import random
word_list = ["aardvark", "baboon", "python", "camel", "chicken", "penguin", "leapord", "elephant", "monkey"]
chosen_word = random.choice(word_list)

#Testing code
# print(f'Pssst, the solution is {chosen_word}.')

display = []
word_length = len(chosen_word)
for _ in range(word_length):
    display += "_"
total_guess = 0
missed_guess = 0
end_of_game = False
while not end_of_game:
        guess = input("Guess a letter: ").lower()
        total_guess += 1

        for position in range(word_length):
            letter = chosen_word[position]
            if letter == guess:
                display[position] = letter
            
        if guess in chosen_word:
            print("Letter Correct")
        else:
            print("Letter not correct")
            missed_guess += 1


        print(display)
    
        if "_" not in display:
            end_of_game = True
            print("You Win")
            print(f"The word was {chosen_word}")
            print(f"It took you {total_guess} tries")
            
        elif missed_guess == 5:
            end_of_game = True
            print("Sorry you lost")
            print(f"The word was {chosen_word}")
            



