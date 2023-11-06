
# Magic numbers
Magic numbers are the first few bytes of a file that are unique to a particular file type. 
These unique bits are referred to as magic numbers,  also sometimes referred to as a  file signature.
These bytes can be used by the system to “differentiate between and recognize different files” without a file extension.


- 
Some files, however, do not have magic numbers, such as plain text files, but can be identified by checking the character set (ASCII in the case of text files).
This can be done by using the command:

file -i <file>    # text/plain; charset=us-ascii

-
The file command in Linux reader reads the magic numbers of a file and displays the file type based on the magic number.

- Show magic number
xxd <file> | head

-
Changing the magic numbers of a file renders the file useless. We will be showed an error whenever we try to open a file that has a distorted header.

hexedit <file>
