# Cryptology
Cryptology, is the practice and study of techniques for secure communication in the presence of adversarial behavior. [Cryptology]
 
 
 
## Coding
Coding is the process of converting data from/into a format required for a processing needs.

```sh
plain  <--------------- (Encoding / Decoding) ---------------> coded
```

- Two way process Encoding/Decoding
- Public algorithm / code table
- No key

| Coding | Link |
| ------ | ------ |
| Morse | [Morse Code][Morse] |
| ASCII | [ASCII][ASCII] |
| Base16 | [Base16][Base16] |
| Base64 | [Base64][Base64] |
| Unicode | [Unicode][Unicode] |
| XER | [XER][XER] |
| PEM | [PEM][PEM] |

> hello ---------------> (Encoding-Morse) ---------------> .... . .-.. .-.. ---

## Cryption

```sh
plain  <--------------- (Encryption / Decryption) ---------------> cipher
```

- Two way process Encryption/Decryption
- Public/Private algorithm
- key

> hello ---------------> (Encryption-AES128, k=123) ---------------> f3OghJUQ+Ci/4+A/qjq8UQ==

### Cryption-Coding
```sh
plain  --------------- (Encryption) ---------------> cipher ---------------> (Encoding) ---------------> cipher-coded
```
> hello ---------------> (Encryption-AES128, k=123) ---------------> f3OghJUQ+Ci/4+A/qjq8UQ== ---------------> (Encoding-Morse) ---------------> ..-. ...-- --- --. .... .--- ..- --.- .-.-. -.-. .. -..-. ....- .-.-. .- -..-. --.- .--- --.- ---.. ..- --.- -...- -...-


## Cryptography
Cryptography is a method of protecting information and communications through the use of codes, 
so that only those for whom the information is intended can read and process it.

### Goals
### Algorithms
### Protocols
### CHF
### Tools

## Cryptanalysis
Cryptanalysis refers to the process of analyzing information systems in order to understand hidden aspects of the systems. 
Cryptanalysis is used to breach cryptographic security systems and gain access to the contents of encrypted messages, 
even if the cryptographic key is unknown. [Cryptanalysis]

### Classical Cryptanalysis
### Implementation Attacks
### Social Engineering Attacks

### Steganography
### Obfuscation

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen.)
   [Cryptology]: <https://en.wikipedia.org/wiki/Cryptology>
   [Cryptanalysis]: <https://en.wikipedia.org/wiki/Cryptanalysis>

   [Morse]: <https://en.wikipedia.org/wiki/Morse_code>
   [ASCII]: <https://en.wikipedia.org/wiki/ASCII>
   [Base16]: <https://en.wikipedia.org/wiki/Base16>
   [Base64]: <https://en.wikipedia.org/wiki/Base64>
   [Unicode]: <https://en.wikipedia.org/wiki/Unicode>
   [XER]: <https://en.wikipedia.org/wiki/ASN.1>
   [PEM]: <https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail>