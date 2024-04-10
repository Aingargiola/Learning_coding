# Overview
Today we are going to set up our github and create a good looking read me file.

# Steps

- Create a github repository where we will store our code during this class
    - https://github.com/
    - Make sure you add a readme file to your github
- Open up your readme file and copy the code below inside of it and update the items needed please check everywhere and replace with your own info or this will not work
- https://github.com/Aingargiola/Aingargiola/blob/main/README.md?plain=1
 

- Need to update lines 1, 4, 7, 13, 15, 17, 19, 24, 27, 39, 40

# Cloning our repository to  vscode and our local device
- On your repository page find the green code button and click on it and copy the https link
- Now open up vscode and click file, new window
- When the new windows opens up click clone Git Hub Repository and paste the link in the top search bar.
- A file explorer will pop up and ask you to save the file make sure you save it somewhere easy to access.

# Pushing to GitHub
- Create a new file inside vscode in your repository and call it firstpush.txt
- Press file save or turn on autosave
- Inside that file type a few lines such as trying to set up github
- Now at the top of your screen click terminal, new terminal
- Now we should have a bash terminal open at the bottom of the screen and we are going to run these commands.
 - git add *
 - git commit -m "Firstpush"
    - The part in quotes is the description of the commit
- You probably got a message saying please confirm your github run the command
    - git config --global user.email "Youremail"
- Once the command above completes you can run the command
    - git push
- We should now be able to refresh our github page and see the new file and you are all set