# We are going to use the psutil command to format a script to check these items.  cpu times, cpu percentatge, disk partion's, users and net connections.  
# You may have to do some extra modification to make the ouput be more readable.



import psutil

print(psutil.cpu_times())

print(psutil.cpu_percent())

print(psutil.disk_partitions())   

print(psutil.users())
