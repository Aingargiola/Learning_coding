# Write a script that counts the number of the lines in a file.
# Hint need to use the wc command

#!/bin/bash
file="ping.txt"
line_count=$(wc -l < "$file")
echo "Number of lines: $line_count"