#!/bin/bash

#Snap can be installed on Fedora from the command line:
sudo dnf install snapd

#To enable classic snap support, enter the following to create a symbolic link between /var/lib/snapd/snap and /snap:
sudo ln -s /var/lib/snapd/snap /snap

#To install Postman, simply use the following command:
sudo snap install postman
