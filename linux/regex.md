
# Regular expressions
- meta
    .       one character
    \.      .

- character classes
    [a-z]
    [0-9]
    {11}

- line and word anchors
    ^       start of the line
    $       end of the line
    \<      start of a word
    \>      end of a word
    |       alternation operator
    \b
    \w

## grep
grep [OPTION]... PATTERNS [FILE]...

- OPTION
    -i      case insensitive
    -w      whole-word search
    -r      recursively search through sub-folders
    -v      inverted search
    -H      print the filename for each match
    -q      return only result mode $?
    -E      Extended regex
    -o      only matched part shown
    -n      print line number with output lines


# grep sample

- grep -roE '.{20}apiKey.{20}' .            #Find 20 character before and after