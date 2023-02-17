import psutil

#file = open('cpu.txt', 'w')
file2 = psutil.cpu_times()
print(psutil.cpu_times()) 


# c:/Users/ainga/OneDrive/Desktop/teaching-code/python/ops11.py > cpu.txt  This to output ot text file