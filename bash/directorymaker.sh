#!/bin/bash
#stlouis-ops-201n3 Class 4 Ops Challenge
#Write a script that:
#Creates four directories: dir1, dir2, dir3, dir4
#Put the names of the four directories in an array
#References the array variable to create a new .txt file in each directory
mkdir dir1
mkdir dir2
mkdir dir3
mkdir dir4
folders=("dir1" "dir2" "dir3" "dir4")
touch ${folders[0]}/text.txt
touch ${folders[1]}/text.txt
touch ${folders[2]}/text.txt
touch ${folders[3]}/text.txt