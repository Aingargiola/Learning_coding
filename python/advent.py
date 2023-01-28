# Setup
import random
yes_no = ["yes", "no"]
directions = ["left", "right", "forward", "backward"]
 
# Introduction
name = input("What is your name, adventurer?\n")
print("Greetings, " + name + ". Let us go on a quest!")
print("You find yourself on the edge of a dark forest.")
print("Can you find your way through?\n")
 
# Start of game
response = ""
while response not in yes_no:
    response = input("Would you like to step into the forest?\nyes/no\n")
    if response == "yes":
        print("You head into the forest. You hear crows cawwing in the distance.\n")
    elif response == "no":
        print("You are not ready for this quest. Goodbye, " + name + ".")
        quit()
    else: 
        print("I didn't understand that.\n")
 
# Next part of game
response = ""
while True:
    print("To your left, you see a bear.")
    print("To your right, there is more forest.")
    print("There is a rock wall directly in front of you.")
    print("Behind you is the forest exit.\n")
    response = input("What direction do you move?\nleft/right/forward/backward\n")
    if response == "left":
        print("You encounter a bear what do you do?")
        fight = input("fight the bear y/n\n")
        if  fight == "y":
            print("Diced rolled to see if you beat bear")
            number = random.randint(1, 10)
            if number >= 5:
                print(f"you have defeated the bear with a roll of {number} and escaped the forest")
                response = ""
            else: print("You rolled less than 5 the bear ate you") 
            quit()
        else: print("you ran away")
        
    elif response == "right":
        print("You head deeper into the forest.\n")
    elif response == "forward":
        wall = input("You find a wall you can scale do you scale it?.y/n\n")
        if wall == "y":
            print("You scale the wall and find a dragon")
            dragon = input("Do you charm the dragon or run? c/r\n")
            if dragon == "c":
                print("Your ride the dragon to safety")
                quit()   
            else: print("The dragon catches you and eats you")
            quit()
        response = "" 
    elif response == "backward":
        print("You leave the forest. Goodbye, " + name + ".")
        quit()
    else:
        print("I didn't understand that.\n")
    play_again = input("Play again? (y/n): ")
    if play_again.lower() != "y":
        break
