# Task 1
#Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
Get-Process | Sort-Object -Property cpu -Descending 
 
# Task 2
#Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
Get-Process | Sort-Object Id -Descending

 
# Task 3
#Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 5
 
# Task 4
#Start a browser process (such as Google Chrome or MS Edge) and have it open https://owasp.org/www-project-top-ten/.
Start-Process -FilePath "C:\Program Files (x86)\Internet Explorer\iexplore.exe" https://owasp.org/www-project-top-ten/
 
# Task 5
#Start the process Notepad ten times using a for loop.
for ($i=1 ; $i -le 10; $i++)
{
    Start-Process -FilePath "C:\Program Files (x86)\Internet Explorer\iexplore.exe" https://owasp.org/www-project-top-ten/
}
 
# Task 6
#Close all instances of the Notepad.
Stop-Process -name msedge
 
# Task 7

Start-Process -FilePath "C:\Program Files (x86)\Internet Explorer\iexplore.exe" https://owasp.org/www-project-top-ten/
 
Get-Process -Name msedge | Select-Object -Property Id | Stop-Process

Get-Help