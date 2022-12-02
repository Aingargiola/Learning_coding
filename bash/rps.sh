#!/bin/bash

echo "Lets play a game"

echo "Enter (R)ock, (P)aper, (S)cissor"
read user
choice=(R P S)
computer=${choice[$((RANDOM%3))]}
 echo $computer

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



# # #!/bin/bash
# echo "Wellcome to play Rock, Papaer, Scissors"
# echo "Choose (R)ock, (P)aper or (S)cissors."
# #read players choise
# read PLAYER
# choices=( R P S )
# #randomize the computer choice
# COMPUTER=${choices[$((RANDOM%3))]}
# if      [[ $PLAYER = R &&  $COMPUTER = S ]]
# then    echo "YOU WIN, rock beats scissors";
# elif    [[ $PLAYER = S && $COMPUTER = P ]]
# then    echo "You Have Won a Game. Scissors cut paper.";
# elif    [[ $PLAYER = P && $COMPUTER = R ]]
# then    echo "Winrar is U! Paper covers bloody rocks.";
# elif    [[ $PLAYER = R && $COMPUTER = P ]]
# then    echo "You are a lost game. Paper conseals your rock";
# elif    [[ $PLAYER = S && $COMPUTER = R ]]
# then    echo "Checkmate!The Rock smashes your Scissors!";
# elif    [[ $PLAYER = P && $COMPUTER = S ]]
# then    echo "Game over. Scissors of doom cut fiercely through your plain paper";
# else echo "You have chosen the same weapon for this battle.";
# fi