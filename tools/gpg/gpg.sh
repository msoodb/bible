
# resource https://www.howtogeek.com/427982/how-to-encrypt-and-decrypt-files-with-gpg-on-linux/

# import key
$gpg --import tryhackme.key

# decrypt message
$gpg --decrypt message.gpg > message.txt
