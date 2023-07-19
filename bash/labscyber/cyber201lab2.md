---
marp: true
paginate: true
---



---

# SSH Ubuntu Server
# Overview
In this lab we will be using the remote access tool to gain access to an Ubuntu  Server
# Objectives
- Deploy an Ubuntu Server VM as your development environment
- Access the Ubuntu Server VM from Bash command line on your personal devices or Lab pc
# Resources
- https://code.visualstudio.com/docs/remote/ssh
- https://www.cloudways.com/blog/git-cheat-sheet/
- https://ubuntu.com/download/server
# Tasks
# Part 1: Deploy Ubuntu Server
- If you have not already, download the Ubuntu Server 22.04 ISO.
- First, create a Ubuntu Server VM on VirtualBox.
- 1 core and 1gb of RAM is fine.
- Put the VM on bridge mode.
- During the “Guided storage configuration” step of OS installation, unselect the option “Set up this disk as an LVM group”.
- Once installation is complete, don’t forget to run sudo apt update and sudo apt upgrade to make sure everything is up to date.
- Ubuntu server is only command line there is no GUI
- Establish SSH connectivity from your personal system to the Ubuntu Server VM. Include screenshots of your SSH connectivity.


# Part 2: REMOTE SSH into the Server

- First we need to figure out the IP address of the server by running the command: ifconfig
- Once we have achieved the ip address of the Ubunutu server lets write it down and find the ip of the device we want to connect.  NOTE These ip address should look very similar if they are set up on the same network
- Now from our lab PC or personal PC  in the bash command prompt run SSH@ipaddress
- After you run this command you will be prompted for a password this would be the password of the server pc we just set up.  NOTE: The password will not show any characters being typed for security purposes.


# Part 3: Running commands and Creating files remotely
- Now that we have remote access into the Unbuntu Server lets run the command ifconfig from our personal pc and see which ip address is given?
- Now lets run the command:  touch try.txt
- Now lets run the command: cat try.txt, and try and type some info into the terminal
- Now we have created a text file on the Ubuntu server lets go back to our sever VM and open the text file we have created.
# Part 4: Questions
- What port does SSH use to remote into other devices?
- You have successfully used SSH to remote into a file server. Why would you use SSH in the real world?
- How would you use SSH if you are not on the same home network?
