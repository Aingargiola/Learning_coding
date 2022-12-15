#!/bin/bash

echo "Lets play a game"

echo "Enter (R)ock, (P)aper, (S)cissor"
read user
choice=(R P S)
computer=${choice[$((RANDOM%3))]}
 echo $computer "is computers choice"

if [[ $user = R && $computer = P ]]
    then echo "Sorry you lose";
elif [[ $user = R && $computer = S ]]
    then echo "You win!!!!";
elif [[ $user = P && $computer = S ]]
    then echo "Sorry you lost scissor beats paper";
elif [[ $user = P && $computer = R ]]
    then echo "You win paper beats rock";
elif [[ $user = S && $computer = R ]]
    then echo "You lose "$computer" beats Paper";
elif [[ $user = S && $computer = P ]]
    then echo "You win Scissor beats ";
else echo "Its a tie";
fi



