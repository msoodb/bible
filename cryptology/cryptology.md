[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# Cryptology
   - Cryptography
   - Cryptanalysis

<br/>
<br/>

## Cryptography
   - Secure Communication Over Insecure Channels, Alice and Bob point of view

   ```sh
   Alice ---------------------------------------------------------------------------------> Bob
                                             |
                                             |
                                             |
                                             |
                                             |
                                            Eve
   ```
   

<br/>

## Cryptanalysis
   - Cryptanalysis is the process of analyzing cryptographic systems to look for 
   weaknesses or leaks of information, Eve point of view

   ```sh
   Alice ---------------------------------------------------------------------------------> Bob
                                             |
                                             |
                                             |
                                             |
                                             |
                                            Eve
   ```

<br/>
<br/>

- Some terms and definitions

| term | definition | sample |
| ------ | ------ | ------ |
| Alice | Sender of the message | |
| Bob | Receiver | |
| Eve | Eavesdropper or unintended party | |
| Plaintext | Message to be sent | "meet me at the hotel." |
| Codetext | Coded message | -- . . - -- . .- - - .... . .... --- - . .-.. .-.-.- |
| Ciphertext | Encrypted message| U2FsdGVkX1+iot/Zcl7Oq+4DcNcP/OHtSxH3V4vgAFVXgTXbIWAMMO7zqW0J2/Ue |
| Encoding | Converting data from plaintext to codetext | |
| Decoding | Converting data from codetext to plaintext | |
| Encryption | Converting data from plaintext to ciphertext with a key, which can only be decrypted by the key | |
| Decryption | Converting data from ciphertext to plaintext by the key | |
| Hash | It is a one-way function, that maps data of an arbitrary size to a bit array of a fixed size  | sha1("meet me at the hotel.") = af9d989aefce179cd43ee35ffde6824dc5cba257 |
| cipher | An algorithm for performing encryption or decryption | aes-128-cbc |
| Cipher suite | A set of algorithms that help secure a network connection, a key exchange algorithm, a bulk encryption algorithm, and a message authentication code (MAC) algorithm | SA-PSK-AES256-GCM-SHA384 TLSv1.2 Kx=RSAPSK   Au=RSA  Enc=AESGCM(256) Mac=AEAD|
| Cryptosystem | | |
| Cryptography | | |
| Cryptanalysis | | |
| Cryptology | | |

<br/>
<br/>

# Concept
   - Obfuscation
   - Steganography
   - Coding
   - Encryption
   - Hash Functions

<br/>
<br/>

## Obfuscation
Is the obscuring of the intended meaning of communication by making the message difficult to understand, 
usually with confusing and ambiguous language. [Obfuscation]  
[![N|Solid](src/Editors-Peak17.jpg)](/src/Editors-Peak17.jpg/)

<br/>

## Steganography
Is the practice of concealing a message within another message or a physical object. [Steganography]

[![N|Solid](src/music-code.jpg)](/src/music-code.jpg/)

[![N|Solid](src/stego_images.jpg)](/src/stego_images.jpg/)

<br/>

## Coding

Coding is the process of converting data from/into a format required for a processing needs.

```sh
plaintext  ---------------(Encode)---------------> codetext
```

```sh
codetext  ---------------(Decode)---------------> plaintext
```


[![N|Solid](src/morse.jpg)](/src/morse.jpg/)
<br/>

[![N|Solid](src/Semaphore_Signals_A-Z.jpg)](/src/Semaphore_Signals_A-Z.jpg/)
<br/>

| Coding | Sample | Link |
| ------ | ------ |------ |
| Morse | .... . .-.. .-.. --- | [Morse Code][Morse] |
| Flag semaphore |  | [Flag semaphore][Flag semaphore] |
| ASCII | 0110100001100101011011000110110001101111 | [ASCII][ASCII] |
| Base16 | 68656c6c6f | [Base16][Base16] |
| Base64 | aGVsbG8= | [Base64][Base64] |
<br/>

<br/>

## Encryption

Encryption is the process of securing data for a processing needs.


   ```sh
   plaintext  ---------------(Encrypt, key=K)---------------> ciphertext
   ```

   ```sh
   ciphertext  ---------------(Decrypt, key=K)---------------> plaintext
   ```


[![N|Solid](src/encryption.png)](/src/encryption.png/)
<br/>

[![N|Solid](src/encryption-encrypt.png)](/src/encryption-encrypt.png/)
<br/>

[![N|Solid](src/encryption-decrypt.png)](/src/encryption-decrypt.png/)

<br/>


   > key is a binary string.
   
   32 bit key
   ```sh
   11101100000111000110001111100111
   ```   

   <br/>

   128 bit key
   ```sh
   10100110110011111000010001101011011011101111111011100111110100101101110100011011010010
   010001100010101111000011100110000011111110
   ```

   <br/>

   256 bit key
   ```sh
   001110111010111100100010001111101111011010001100110000010111111000000000000001000111000
   011110111010111100110100101001101101000000110011111110011010000000011110001001111111010
   1001110011010010011010011101010001101110101000000111101000011011111000000011011100
   ```
   

<br/>

## Hash Functions

A cryptographic hash function (CHF) is a mathematical algorithm that maps data of an arbitrary
size (often called the "message") to a bit array of a fixed size (the "hash value", "hash", or
"message digest"). It is a  one-way  function, that is, a function for which it is practically
infeasible to invert or reverse the computation.


<br/>

[![N|Solid](src/hash.jpg)](/src/hash.jpg/)

<br/>

| Algorithm | Sample | Link |
| ------ | ------ |------ |
| MD5| b1946ac92492d2347c6235b4d2611184 | [MD5] |
| SHA-1 | f572d396fae9206628714fb2ce00f72e94f2258f | [SHA-1] |
| SHA-2 | 5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03 | [SHA-2] |
| SHA-3 | 1d0f284efe3edea4b9ca3bd514fa134b17eae361ccc7a1eefeff801b9bd6604e01f21f6bf249ef030599f0c218f2ba8c | [SHA-3] |


   - cryptographic hash function must be deterministic.
   - it is quick to compute the hash value for any given message.
   - it is infeasible to generate a message that yields a given hash value.
   - it is infeasible to find two different messages with the same hash value.
   - a small change to a message should change the hash value so extensively that a new hash value appears
    uncorrelated with the old hash value (avalanche effect).

| Input | Algorithm | Hash |
| ------ | ------ |------ |
| my name is masoud bolhassani, from chenarestan. | SHA-1 | 196cd8dab8e773c68be35016c0c1d83e2a86701d |
| my name is masoud bolhasani, from chenarestan. | SHA-1 | 239d4a179184852114841fa77c8640511e47bfd5 |

<br/>

## Cryptography
Cryptography is a method of protecting information and communications, so that only those for whom 
the information is intended can read and process it. [Cryptography]

   ### Communication

   - Insecure Communication

      ```sh
      Alice ---------------------------------------------------------------------------------> Bob
                                                |
                                                |
                                                |
                                                |
                                                |
                                               Eve ✔
      ```
      Obfuscation, Steganography, or Coding

      > hello --------(Encode-Morse)------> .... . .-.. .-.. --- \
      > .... . .-.. .-.. --- ----------(Decode-Morse)---------------> hello

   <br/>

   - Secure Communication

      ```sh
      Alice ---------------------------------------------------------------------------------> Bob
                                                |
                                                |
                                                |
                                                |
                                                |
                                               Eve ✗
      ```
      Encryption

      > hello ---------(Encrypt -aes-128-cbc -base64 -pbkdf2, k=123)-------> U2FsdGVkX1+7GdnvVY9U/g+ABDxG3n+E9V4ca4pxWzk= \   
      > U2FsdGVkX1+7GdnvVY9U/g+ABDxG3n+E9V4ca4pxWzk= ---------------(Decrypt -aes-128-cbc -base64 -pbkdf2, k=123)---------------> hello

      ```sh
      echo -n hello | openssl enc -e -aes-128-cbc -base64 -nosalt -pbkdf2 -k 123
      echo L31utJulbs5/CWmkUixfJA== | openssl base64 -d | openssl enc -d -aes-128-cbc -nosalt -pbkdf2 -k 123
      ```

      - Perfect secrecy
      - Computational security
   <br/>

   ### History
      - Classic cryptography [... - WWII]
      - Computer era         [1945 - 1970]
      - Modern cryptography  [1970 - ...]

<br/>

### Classic cryptography [... - WWII]
The main classical cipher types are transposition ciphers, which rearrange the order of letter in a 
message (e.g., 'hello world' becomes 'ehlol owrdl' in a trivially simple rearrangement scheme), and
substitution ciphers, which systematically replace letters or groups of letters with other letters or
groups of letters (e.g., 'fly at once' becomes 'gmz bu podf' by replacing each letter with the one
following it in the Latin alphabet)

   - [Caesar cipher]
   - [Auguste Kerckhoffs Rules]
   - [Enigma machine]
   [![N|Solid](src/Enigma.png)](/src/Enigma.png/)
   [Enigma Online Emulator]

<br/>

### Computer era [1945 - 1970]
A Mathematical Theory of Cryptography
Claude E. Shannon — Published September 1945

> In 1948, Claude E. Shannon published the paper [A Mathematical Theory of Communication], which is seen as the foundation of modern information theory. \
> In 1949, Shannon published [Communication Theory of Secrecy Systems] which relates cryptography to information theory, and should be seen as the foundation of modern cryptography.

> Both papers derive from a technical report, [A Mathematical Theory of Cryptography], written by Shannon in 1945. In this report, Shannon defined, and mathematically proved, perfect secrecy.  
[![N|Solid](src/Shannon_Claude_E_1948_A_Mathematical_Theory_of_Communication_offprint.jpg)](/src/Shannon_Claude_E_1948_A_Mathematical_Theory_of_Communication_offprint.jpg/)

<br/>

### Modern cryptography [1970 - ...]
   - Goals
      > Confidentiality \
      > Integrity \
      > Authentication \
      > Non-repudiation
   - Encryption Algorithms Algorithms
      > Symmetric \
      > Asymmetric
   - Cryptographic Hash Functions
      > Hash \
      > MAC \
      > HMAC
   - Applications:
      > Military \
      > Intelligence Agency \
      > Web \
      > Email \
      > Messanger \
      > Cryptocurrency \
      > Digital Signatures \
      > IoT     
   - Protocols
      > SSH \
      > SSL-TLS \
      > Kerberos \
      > IPSec   
   - Tools
      > OpenSSH \
      > OpenSSL \
      > GPG

<br/>

### Goals
 In Cryptography, an Adversary is a malicious entity, which aims to retrieve precious information
 or data thereby undermining the principles of information security. \
 Data Confidentiality, Data Integrity, Authentication and Non-repudiation are core principles of modern-day cryptography. \
[![N|Solid](src/cia-triad.png)](/src/cia-triad.png/)
- [Confidentiality], the information cannot be understood by anyone for whom it was unintended.
- [Integrity], the information cannot be altered in storage or transit between sender and intended receiver without the alteration being detected.
- [Authentication], the sender and receiver can confirm each other’s identity and the origin/destination of the information.
- [Non-repudiation], the creator/sender of the information cannot deny at a later stage his or her intentions in the creation or transmission of the information. 

### Algorithms: Symmetric
Are algorithms for cryptography that use the same cryptographic keys for both the encryption of plaintext and the decryption of ciphertext.
[![N|Solid](src/Symmetric-Encryption.png)](/src/Symmetric-Encryption.png/)

```
          Encrypt(plaintext, key) --> ciphertext        Decrypt(ciphertext, key) --> plaintext
   Alice --------------------------------------------------------------------------------------> Bob
                                                   |
                                                   |
                                                   | Decrypt(ciphertext, ???) --> xxxxxx
                                                   |
                                                   |
                                                  Eve
```

- Stream
   - Classic
      - Substitution: caesar-cipher, Shift-cipher, vigenère-cipher
      - Transposition
   - LFSR
   - OTP
   - RC4
- Block
   - [DES], 1976
   - [AES], 2001 
   - 3DES

<br/>

### Algorithms: Asymmetric
Asymmetric encryption uses two keys to encrypt and decrypt a plaintext.  
[![N|Solid](src/Asymmetric-Encryption.png)](/src/Asymmetric-Encryption.png/)

```
         Encrypt(plaintext, Bob's public key) --> ciphertext    Decrypt(ciphertext, private key) --> plaintext
   Alice ---------------------------------------------------------------------------------------------------> Bob
                                                         |                                {public key, private key}
                                                         |
                                                         | ciphertext
                                                         | Bob's private key = ???
                                                         | plaintext = xxxxxx
                                                         |
                                                         |
                                                        Eve
```

- Diffie-Hellman
- [RSA]
- DSA
- Elliptic-Curve


<br/>

# Tools
- [openssl] a robust, commercial-grade, full-featured toolkit for general-purpose cryptography and secure communication.
- openssh   
- gpg 

# Cryptanalysis
Cryptanalysis refers to the process of analyzing information systems in order to understand hidden
 aspects of the systems. Cryptanalysis is used to breach cryptographic security systems and gain 
 access to the contents of encrypted messages, even if the cryptographic key is unknown. 
 [Cryptanalysis] or "Simpley decrypty a ciphertext without knowing the key".

   - Brute Force Attack (BFA)
      - Brute Force
      - Dictionary
      - Rainbow Table      
   - Ciphertext Only Attacks (COA)
   - Known Plaintext Attack (KPA)
   - Chosen Plaintext Attack (CPA)
   - Adaptive Chosen-Plaintext Analysis (ACPA)
   - Man-In-The-Middle (MITM) attack

   - Side Channel Attack (SCA)

<br/>

## Brute force attack
As an old technique, brute force means exhausting very possibility until a match is found. Even in classic cryptography, brute force attack is considered time-consuming.
In modern cryptography, the length of a brute force attack depends exponentially on the length of the key. Since modern cryptography uses very long keys, brute force attack is considered inefficient for all practical purposes.

```
          Encrypt(plaintext, key) --> ciphertext        Decrypt(ciphertext, key) --> plaintext
   Alice --------------------------------------------------------------------------------------> Bob
                                                   |
                                                   |
                                                   | Decrypt(ciphertext, ???) --> xxxxxx
                                                   | 128 bit key = ???
                                                   |
                                                  Eve
```

Example: key length is 128 bit

- possible keys:
```
   00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
   00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001
   00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010
   00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011
   00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100
   00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101
   00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111
   00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000
   .....
   .....
   .....
   .....
   11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
```
- how many possible key: 2^128 = 340,282,366,920,938,463,463,374,607,431,768,211,456 =~ 3.4 x 10^38

So a 128-bit symmetric key is computationally secure against brute-force attack. Why?

- flops: floating point operations per second (FLOPS, flops or flop/s) is a measure of computer performance
- We have a supercomputer with 100 exaFLOPS power, 100 * 10^18.
- Number of Flops required per combination check: 1000 
   - => Number of combination checks per second = (100 * 10^18) / (10^3) = 100 * 10^15 = 1 * 10^17
   - => Number of Seconds to crack AES with 128-bit Key = (3.4 x 10^38) / (1 * 10^17) = 304 * 10^20 second
- Number of seconds in one Year = 31536000 = (315 * 10^5)
   - => Number of Years to crack AES with 128-bit Key = (304 * 10^20) / (315 * 10^5) = 1 * 10^15 years



<br/>

## Chosen plaintext attack
The attacker, in this case, inputs a plaintext and observes the output ciphertext obtained. By examining the plaintext – ciphertext pair, he can easily guess the encryption key. The differential analysis done on RSA algorithm is an example of such attack.

<br/>

## Man in the middle attack

Algorithms: Asymmetric

```
         Encrypt(plaintext, Bob's public key) --> ciphertext    Decrypt(ciphertext, private key) --> plaintext
   Alice ---------------------------------------------------------------------------------------------------> Bob
                                                            |                                {public key, private key}
                                                            |
                                                            | Bob's private key = ???
                                                            | ciphertext = xxxxxx
                                                            |
                                                            |
                                                           Eve
```

attack scenario: Eve send his public key to Alice
```
         Encrypt(plaintext, Eve's public key) --> ciphertext    Decrypt(ciphertext, private key) --> xxxxxxx
   Alice ---------------------------------------------------------------------------------------------------> Bob
                                                            |                                {public key, private key}
                                                            |
                                                            | 
                                                            | Decrypt(ciphertext, private key) --> plaintext
                                                            |
                                                            |
                                                           Eve {public key, private key}
```
<hr/>

- <https://en.wikipedia.org/wiki/Cryptography>
- <https://en.wikipedia.org/wiki/Cryptanalysis>
- https://resources.infosecinstitute.com/topic/cryptanalysis-tools/
- https://en.wikipedia.org/wiki/FLOPS
- <https://evervault.com/papers/shannon-communication.pdf>

[//]: # (These are reference links used in the body of this note and get stripped out when 
the markdown processor does its job. There is no need to format nicely because it shouldn't be seen.)
   [Cryptography]: <https://en.wikipedia.org/wiki/Cryptography>
   [Cryptanalysis]: <https://en.wikipedia.org/wiki/Cryptanalysis>

   [Morse]: <https://en.wikipedia.org/wiki/Morse_code>
   [Flag semaphore]: <https://en.wikipedia.org/wiki/Flag_semaphore>
   [ASCII]: <https://en.wikipedia.org/wiki/ASCII>
   [Base16]: <https://en.wikipedia.org/wiki/Base16>
   [Base64]: <https://en.wikipedia.org/wiki/Base64>
   [Unicode]: <https://en.wikipedia.org/wiki/Unicode>
   [XER]: <https://en.wikipedia.org/wiki/ASN.1>
   [PEM]: <https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail>

   [Caesar cipher]: <https://en.wikipedia.org/wiki/Caesar_cipher>
   [Auguste Kerckhoffs Rules]: <https://en.wikipedia.org/wiki/Auguste_Kerckhoffs>
   [Enigma machine]: <https://en.wikipedia.org/wiki/Enigma_machine>
   [Enigma Online Emulator]: <https://www.101computing.net/enigma/enigma-M3.html>

   [Steganography]: <https://en.wikipedia.org/wiki/Steganography>
   [Obfuscation]: <https://en.wikipedia.org/wiki/Obfuscation>

   [A Mathematical Theory of Communication]: <https://evervault.com/papers/shannon-communication.pdf>
   [Communication Theory of Secrecy Systems]: <https://evervault.com/papers/shannon-secrecy.pdf>
   [A Mathematical Theory of Cryptography]: <https://evervault.com/papers/shannon.pdf>

   [MD5]: <https://en.wikipedia.org/wiki/MD5>
   [SHA-1]: <https://en.wikipedia.org/wiki/SHA-1>
   [SHA-2]: <https://en.wikipedia.org/wiki/SHA-2>
   [SHA-3]: <https://en.wikipedia.org/wiki/SHA-3>


   [Military]: <>
   [Intelligence agency]: <>
   [Web]: <>
   [Email]: <>
   [Messanger]: <>
   [Cryptocurrency]: <>
   [Digital Signatures]: <>
   [IoT]: <>
   
   [Confidentiality]: <>
   [Integrity]: <>
   [Authentication]: <>
   [Non-repudiation]: <>

   [DES]: <https://en.wikipedia.org/wiki/Data_Encryption_Standard>
   [AES]: <https://en.wikipedia.org/wiki/Advanced_Encryption_Standard>
   [RSA]: <https://en.wikipedia.org/wiki/RSA_(cryptosystem)>
   [openssl]: <https://www.openssl.org/>
