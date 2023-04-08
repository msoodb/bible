
A python string is a list of characters in order. A character is anything you can type on the keyboard in one keystroke,
like a letter, a number, or a backslash.

- Strings can have spaces: "hello world".
- An empty string is a string that has 0 characters.
- Python strings are immutable.
- Python recognize as strings everything that is delimited by quotation marks (" " or ' ').


## Create a String
```python
word = "Hello World"
word = 'Hello World'
```

## Access characters in a String
- python indexing operator []
```python
word = "Hello World"
letter=word[0]
```

## Find Length of a String
-  len() function
```python
word = "Hello World"
l = len(word)
```

## Find a Character in a String
```python
word = 'hello world'
i = word.find('h')
```

## Count the number of spaces in a string
```python
w.count(' ')
```

## String Slicing
```python
word = "Hello World"
print word[0]           #get one char of the word
print word[0:1]         #get one char of the word (same as above)
print word[0:3]         #get the first three char
print word[:3]          #get the first three char
print word[-3:]         #get the last three char
print word[3:]          #get all but the three first char
print word[:-3]         #get all but the three last character
```

## Split Strings in Python
word.split(' ')

## Check if a string Startswith or Endswith a character
word.startswith('h')
word.endswith('h')

## Repeat Strings Multiple Times
print "."* 10           # prints ten dots

## Replace Substring in a String in Python
word.replace('world', 'hacker')

## Changing Upper and Lower Case Strings
word.upper()
word.title()
word.lower()
word.capitalize()
word.swapcase() 

## Reverse a String in Python
''.join(reversed(word))

## Strip a String in Python
strip()         #removes from both ends
lstrip()        #removes leading characters (Left-strip)
rstrip()        #removes trailing characters (Right-strip)

## Concatenate Strings in Python
"Hello " + "World"                  # = "Hello World"
"Hello " + "World" + "!"            # = "Hello World!"

## join
":".join(word)                      #add a : between every char

## Testing
```python
word.isalnum()                      #check if all char are alphanumeric 
word.isalpha()                      #check if all char in the string are alphabetic
word.isdigit()                      #test if string contains digits
word.istitle()                      #test if string contains title words
word.isupper()                      #test if string contains upper case
word.islower()                      #test if string contains lower case
word.isspace()                      #test if string contains spaces
word.endswith('d')                  #test if string endswith a d
word.startswith('H')                #test if string startswith H
```

# What’s a Character Encoding
a way of translating characters (such as letters, punctuation, symbols, whitespace, and control characters) to integers and ultimately to bits.

## ASCII
It encompasses the following:
- Lowercase English letters: a through z
- Uppercase English letters: A through Z
- Some punctuation and symbols: "$" and "!", to name a couple
- Whitespace characters: an actual space (" "), as well as a newline, carriage return, horizontal tab, vertical tab, and a few others
- Some non-printable characters: characters such as backspace, "\b", that can’t be printed literally in the way that the letter A can

```python
import string

s = "What's wrong with ASCII?!?!?"
s.rstrip(string.punctuation)
```

# A Bit of a Refresher
0 or 1
Decimal | Binary (Compact) 	| Binary (Padded Form)
0 	0 	    00000000
1 	1 	    00000001
2 	10 	    00000010
3 	11 	    00000011
4 	100 	00000100
5 	101 	00000101
6 	110 	00000110
7 	111 	00000111

# Python’s Format Specification Mini-Language