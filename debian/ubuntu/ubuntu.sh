#!/bin/bash

### Utility

## Remove Ubuntu Specific Packages
# Remove Cloud-Init
sudo apt purge cloud-init -y
sudo rm -rf /etc/cloud && sudo rm -rf /var/lib/cloud/

## Update & Upgrade APT
sudo apt update -y && sudo apt upgrade -y

## Install and configure fish
sudo apt install fish -y
chsh -s $(which fish)