# Requirements for assignment:
# Create if statements using logical conditons
#


import os


# Define Variables
first_line = "Here is the first line of text in my new file."
line1 = "This is an additonal line of text for my life. \n"
line2 = "This is another additional line. \n"
line3 = "This is the last line of text for the file. \n"


# Main


# Create a new file and add one line of text.
file1 = open("first_text_file.txt", "w")
file1.write(first_line)
file1.close()


# # Read the file before adding any new text.
file2 = open("first_text_file.txt", "r")
print()
print("Read the file before writing new text to it:")
print()
print(file2.read())
file2.close()


# Add three lines of text to the file.
fileadd = open("first_text_file.txt", "a")
fileadd.write("\n")
fileadd.write(line1)
fileadd.write(line2)
fileadd.write(line3)
fileadd.close()


# Re-read the file with the new lines added.
filefull = open("first_text_file.txt", "r")
print()
print("I have written to the file and am reading the entire contents:")
print(filefull.readlines(1))
filefull.close()
os.remove("first_text_file.txt")

# End
