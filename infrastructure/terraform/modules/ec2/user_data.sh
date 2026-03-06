#!/bin/bash
set -xe

# Update system
yum update -y

# Install Docker
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker

# Install git
yum install git -y

# Clone app repo
git clone https://github.com/example/simple-backend-api.git /app

cd /app

# Run container
docker build -t simple-backend .
docker run -d -p 80:80 simple-backend