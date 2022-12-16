import random
user_action = input("Enter a choice (rock, paper, scissors): ")
possible_actions = ["rock", "paper", "scissors"]
computer_action = random.choice(possible_actions)
print(computer_action)
if user_action == computer_action:
    print(f"\nIt is a tie both players picked {user_action}")
elif user_action == "rock":
    if computer_action == "scissors":
        print(f"\n{user_action} beats {computer_action}")
    else: print(f"\nPaper covers rock you lose")
elif user_action == "paper":
    if computer_action == "rock":
        print(f"\n{user_action} beats {computer_action}")
    else: print("scissors beats paper")
elif user_action == "scissors":
    if computer_action == "paper":
        print(f"\n{user_action} beats {computer_action}")
    else: print("Rock beats scissors")

print(f"users choice was {user_action}")
print(f"computer choices was {computer_action}")