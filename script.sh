#!/bin/bash

# Update yum repository
yum update -y

# Install Git
yum install -y git

# Install Docker
yum install -y docker

# Start Docker service
service docker start

# Runs Docker without sudo
usermod -a -G docker ec2-user

# Change directory
cd /home/ec2-user

# Clone the server repository
git clone https://github.com/craig-dsilva/node-challenge-hotel-server.git

# Move server.sh to home directory
cd node-challenge-hotel-server

# Run the script
bash server.sh