# Task 1
$Begin = get-date -Date '7/21/2022 00:00:00'
$End = get-date -date '7/21/2022 23:59:59'
Get-EventLog -LogName System -After $Begin -Before $end > C:\Users\anthony\Desktop\last_24.txt
 
# Task 2
Get-EventLog -LogName System -EntryType Error > C:\users\Matt\Desktop\errors.txt
 
# Task 3
Get-EventLog -LogName System -InstanceID 18
 
# Task 4
Get-EventLog -LogName System -Newest 20

# Task 5
Get-EventLog -LogName System -Newest 500 -Get-Fomat -Wide