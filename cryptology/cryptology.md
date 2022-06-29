
## Coding

Coding is the process of converting data from/into a format required for a processing needs.
```sh
plain  <---------------(Encoding / Decoding)---------------> coded
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

>hello ------------------------------(Encoding-Morse)---------------> .... . .-.. .-.. --- \
>.... . .-.. .-.. --- ---------------(Decoding-Morse)---------------> hello

## Cryption

Cryption is the process of securing data for a processing needs.

- Two way process Encryption/Decryption
- Public/Private algorithm
- key

```sh
plain  <---------------(Encryption / Decryption, key=K)---------------> cipher
```
> hello -------------------------------(Encryption-AES128, key=123)--------------------> f3OghJUQ+Ci/4+A/qjq8UQ== \
> f3OghJUQ+Ci/4+A/qjq8UQ== ------------(Decryption-AES128, key=123)--------------------> hello

<br/>
In this sample we combined encryption and encoding.

```sh
plain  ---------------(Encryption, key=K)---------------> cipher ---------------(Encoding)---------------> cipher-coded
```
> hello ---------------(Encryption-AES128, k=123)---------------> f3OghJUQ+Ci/4+A/qjq8UQ== ---------------(Encoding-Morse)---------------> ..-. ...-- --- --. .... .--- ..- --.- .-.-. -.-. .. -..-. ....- .-.-. .- -..-. --.- .--- --.- ---.. ..- --.- -...- -...-
> ..-. ...-- --- --. .... .--- ..- --.- .-.-. -.-. .. -..-. ....- .-.-. .- -..-. --.- .--- --.- ---.. ..- --.- -...- -...- ---------------(Decoding-Morse)---------------> f3OghJUQ+Ci/4+A/qjq8UQ== ---------------(Decryption-AES128, k=123)---------------> hello


# Cryptography
Cryptography is a method of protecting information and communications through the use of codes, 
so that only those for whom the information is intended can read and process it. [Cryptography]

## History
   - Classic cryptography
   - Computer era
   - Modern cryptography

### Classic cryptography
   - Caesar cipher
   - Auguste Kerckhoffs Rules
   - Enigma machine

### Computer era
   - Mathematics
   - Steganography
   - Obfuscation

### Modern cryptography
   - Goals
   - Symmetric-key
   - Asymmetric/Public-key
   - Protocols
   - Cryptographic Hash Functions
   - Tools


# Cryptanalysis
Cryptanalysis refers to the process of analyzing information systems in order to understand hidden aspects of the systems. 
Cryptanalysis is used to breach cryptographic security systems and gain access to the contents of encrypted messages, 
even if the cryptographic key is unknown. [Cryptanalysis]

   - Classical Cryptanalysis
   - Implementation Attacks
   - Social Engineering Attacks

## Classical Cryptanalysis
## Implementation Attacks
## Social Engineering Attacks

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen.)
   [Cryptography]: <https://en.wikipedia.org/wiki/Cryptography>
   [Cryptanalysis]: <https://en.wikipedia.org/wiki/Cryptanalysis>

   [Morse]: <https://en.wikipedia.org/wiki/Morse_code>
   [ASCII]: <https://en.wikipedia.org/wiki/ASCII>
   [Base16]: <https://en.wikipedia.org/wiki/Base16>
   [Base64]: <https://en.wikipedia.org/wiki/Base64>
   [Unicode]: <https://en.wikipedia.org/wiki/Unicode>
   [XER]: <https://en.wikipedia.org/wiki/ASN.1>
   [PEM]: <https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail>

   [Classic_cryptography]: <https://en.wikipedia.org/wiki/Cryptography#Classic_cryptography>