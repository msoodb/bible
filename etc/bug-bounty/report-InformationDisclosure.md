Title:
Information Disclosure via ZIP file 

Description:
Hello Team
I found two sub domains has an ZIP file and this file contains source code.  

Affected URLs:
https://ash.target.com/app.zip
https://chi.target.com/app.zip

Proof of Concept:
1. Go To This Link: https://ash.target.com/app.zip
2. Download and extract The zip file 
3. You can read the source code


Steps To Reproduce:

1. Fuzzing Hidden Directories and Files using ffuf tool:
2. Find backups files with Nuclei Vulnerability Scanner:  
3. Download and extract
4. You can read the source code

Impact:
An attacker can download this file and read it.

 
 Best Regards