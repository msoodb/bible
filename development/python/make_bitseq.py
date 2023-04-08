#!/bin/python

import string


def n_possible_value(nbits: int) -> int:
    return 2 ** nbits


def make_bitseq(s:str) -> str:
    if not s.isascii():
        raise ValueError("ASCII only allowed!")
    return ' '.join(f'{ord(i):08b}' for i in s)

bits = make_bitseq('bits')
print(bits)

a = n_possible_value(4)
print(a)


int('111')
int('111', base=10)     # Decimal
int('111', base=2)      # Binary
int('111', base=8)      # Octal
int('111', base=16)     # Hex

# literal
11      # Decimal
0b11    # Binary literal
0o11    # Octal literal
0x11    # Hex literal

# Unicode vs UTF-8
"résumé".encode("utf-8")                        # b'r\xc3\xa9sum\xc3\xa9'
b'r\xc3\xa9sum\xc3\xa9'.decode("utf-8")         # 'résumé'


# Python’s Built-In Functions
ascii()