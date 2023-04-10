

This learning track is dedicated to learning the most popular web application vulnerabilities.


# XSS 
- Types    
    - Reflected
    - Stored
    - DOM
- Detection
- Exploitation
- Mitigation

# Authorization bypasses and forced browsing
- Detection
- Exploitation
- Mitigation

# JavaScript for Hackers

# Python for Hackers

# Source Code Review
static analysis tools, techniques for manual review, and tips and tricks to get through the largest source code reviews.
- Managing expectations
    - Metrics
        - Lines of codes.
        - KLOC 100 KLOC/week
        - Number of file, 10 file/day
    - Manual vs automated review
        - Manual for authentication, credential storage, crypto, and so on.
- Tool review
    - Fortify, C, C++, C#, java
    - Checkmarx, java, C#
    - Coverity
    - Veracode
    - OWASP
- Issues with static analysis tools
    - False Positive
- Division of labor
    - Component-based Spiliting
    - Class-based Spiliting
    - File-based
- Tips and tricks
    - Measure
    - Create a jurnal for all file and component and line codes
    - Source Management
    - First looking for ORM and database connection
    - Write autho-script as much as you can
    - Find Language-based buggy function
        - php: $_GET, $_POST

# Cookie Tampering Techniques
some techniques for tampering with cookies.
- Manipulating cookies
    - browser   Firefox
    - Response  Burp
    - requests
- Flags
    - Secure
    - HTTPOnly
- Data encodings
    - Base64
        - end with = and contain /
        - ULI encoding _ / and - +
    - hex
        - range 0-9A-F upper on lower case
- Manipulations
    - Change to see results
    - Swap key-value pair
    - Delete entry
    - Duplicate entry

# Unchecked Redirects
unchecked redirects, make it easy to mask phishing attempts and can even allow violation of authorization constraints.
- What they are
    - perform redirect outside the apolication
- Detection
- Exploitation
- Mitigation

# Null Termination Bugs
- What they are
    - \x00, %00 Used to terminate C strings.
- Why they’re relevant to web security
    - php, runy, python, ... written in C.
- How to test for null termination bugs
- How to exploit these bugs



# SQL Injection and Friends
- Directory traversal
    - Detection
    - Exploitation
    - Mitigation
- Command injection
    - Detection    
    - Exploitation
    - Mitigation
- SQLi (SQL Injection)
    - Detection
    - Exploitation
    - Mitigation
- Blind SQLi
    - Types
    - Detection
    - Exploiting blind

# Session Fixation
- Detection
- Exploitation
- Mitigation

# Clickjacking
- Detection
- Exploitation
- Mitigation

# Password Storage
methods of securely storing passwords and what to watch out for.
- Use 
    - Bcrypt 
    - Scrypt
- Goals for password security
    - Impervious to rainbow table
    - Computationally expensive
    - Unique per-user hash.
        - Salting
- Never use a bare hash (e.g. MD5, SHA1)
    - They’re too fast
- If you can’t use those, use PBKDF2 and slow it way down
