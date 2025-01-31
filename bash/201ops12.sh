#!/bin/bash
# Today we are going to use a case statment instead of a conditional
# Have the program ask how your day is and echo out a response for good or bad
# Case statment format is a little different so please look up how this would be formated




echo -n "how is your day "
read day

case $day in
good) 
    echo -n "i dont care"
    ;;

bad)    
    echo -n "thats good"
    ;;
ok)
    echo -n "Make it better"
    ;;
*)
    echo -n "Error"
    ;;
    esac
