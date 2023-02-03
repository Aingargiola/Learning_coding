#!/bin/bash
# Objectives
# Create a bash script that launches a menu system with the following options:
# Hello world (prints “Hello world!” to the screen)
# Ping self (pings this computer’s loopback address)
# IP info (print the network adapter information for this computer)
# Exit
# Next, the user input should be requested.
# The program should next use a conditional statement to evaluate the user’s input, then act according to what the user selected.
# Use a loop to bring up the menu again after the request has been executed.
user=y
while [ $user = y ]
do
echo "Please make a selection"
echo "1 to print hello world" 
echo "2 ping yourself"
echo "3 to show network config"
read input
    if [ $input = 1 ]
        then echo "Hello World!"
    elif [ $input = 2 ]
        then ping -c 1 192.168.0.1
    elif [ $input = 3 ]
        then ifconfig
    else echo "Invalid entry"
fi
echo "do you want to play again: y/n"
read user
done
