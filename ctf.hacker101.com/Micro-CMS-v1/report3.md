## Title
> Flag

## Description
> In the "edit" page, Description has html-based XSS vulnerability.

## Reproduction Steps
1. Go to home 
2. Click on arbitary post, leads you to /page/<id>
3. Click "Edit this page"
4. In the Description input, type <button type="button" onclick="alert('xss')">Click Me!</button>
5. Click "save" button. wait untill save complete.
6. Click "Go home"
7. Flag0 has shown in Page Source.
