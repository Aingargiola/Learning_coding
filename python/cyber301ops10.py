# Create a Python script that performs the following:

# Prompt the user to type a string input as the variable for your destination URL.

# Prompt the user to select a HTTP Method of the following options:
# GET
# POST
# PUT
# DELETE
# HEAD
# PATCH
# OPTIONS
# Print to the screen the entire request your script is about to send. Ask the user to confirm before proceeding.

# Using the requests library, perform a GET request against your lab web server.

# For the given header, translate the codes into plain terms that print to the screen; for example, a 404 error should print Site not found to the terminal instead of 404.

# For the given URL, print response header information to the screen.
from urllib import response

import requests
b = input("Get, Post, Put, Delete , Head, Patch, Options:")
if b == "Get":
    response = requests.get('https://github.com/Aingargiola/Learning-github-')
elif b == "Post":
    response = requests.post('https://github.com/Aingargiola/Learning-github-')
elif b == "Put":
    response = requests.put('https://github.com/Aingargiola/Learning-github-')
elif b == "Delete":
    response = requests.delete('https://github.com/Aingargiola/Learning-github-')
elif b == "Head":
    response = requests.head('https://github.com/Aingargiola/Learning-github-')
elif b == "Patch":
    response = requests.patch('https://github.com/Aingargiola/Learning-github-')
elif b == "Options":
    response = requests.options('https://github.com/Aingargiola/Learning-github-')
else:
    print("input error")
    quit()
anwser = input("Do you want to continue yes or no: ")
if anwser == "yes":
    print(response)
else:
    print("cancelling")
if b == "Post":
    print("Site not found")
elif b == "Get":
    print("Request has succedded")
elif b == "Put":
    print("This request is Frobidden")
elif b == "Delete":
    print("This request is Forbidden")
elif b == "Head":
    print("Request has Succedded")
elif b == "Patch":
    print("Request is forbidden")
elif b == "Options":
    print("Site not found")
else:
    print("Bad Request")
