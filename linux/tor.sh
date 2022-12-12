#!/bin/bash

# Update Fedora
sudo dnf upgrade --refresh -y

# Install Tor Browser – DNF Fedora Method
sudo dnf install torbrowser-launcher

# Basics
tor --version

