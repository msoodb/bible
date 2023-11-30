
JavaScript files can play a significant role in bug bounty programs, 
where security researchers identify and report vulnerabilities in web applications. 

JavaScript files can include the following
- aws access key
- aws secret key
- api key
- passwords
- admin credential
- secret token
- oauth_token
- oauth token secret

> if you discovered sensitive information it can be reported as information disclosure and you can also benefit from this information if it contains credentials, in this case, it can be reported as broken access control and so on.


# Analyze JavaScript Files

1- Create a list of js files

- httpx
    cat urls | katana | grep js | httpx -mc 200 | tee jss

- subjs
  cat urls | subjs | tee -a jss

2- Looking for any Information Disclosure

- nuclei
    nuclei -l jss -t ~/nuclei-templates/exposures/ -o jss.bugs

- grep
    - Download All links in jss
    
    ```sh
    file="jss"
    # Loop through each line in the file
    while IFS= read -r link
    do
        # Download the JavaScript file using wget
        wget "$link"
    done < "$file"
    ```

    grep -r -E "aws_access_key|aws_secret_key|api key|passwd|pwd|heroku|slack|firebase|swagger|aws_secret_key|aws key|password|ftp password|jdbc|db|sql|secret jet|config|admin|pwd|json|gcp|htaccess|.env|ssh key|.git|access key|secret token|oauth_token|oauth_token_secret|smtp" *.js