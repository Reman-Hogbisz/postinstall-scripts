#!/bin/bash

### Install Docker

## Setup the repository
# Uninstall old versions of docker
sudo apt-get remove docker docker-engine docker.io containerd runc
# Update APT and install dependecies
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release
# Add Docker's official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Set up the repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

## Install Docker Engine
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

## Postinstall Steps
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

### Test docker without escalation

docker run hello-world