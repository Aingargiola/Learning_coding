import psutil

# file = open('cpu.txt', 'w')
file2 = psutil.cpu_times()
print(psutil.cpu_times()) 
print(psutil.cpu_percent()) 
print(psutil.disk_partitions())  
print(psutil.net_connections())
print(psutil.users())


# c:/Users/ainga/OneDrive/Desktop/teaching-code/python/ops11.py > cpu.txt  
# This to output ot text file

#  pip install psutil 
# May have to install exstension before starting