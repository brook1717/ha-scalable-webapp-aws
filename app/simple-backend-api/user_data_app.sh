#!/bin/bash
set -xe

yum update -y
yum install -y docker git

systemctl start docker
systemctl enable docker

git clone https://github.com/brook1717/ha-scalable-webapp-aws.git /app

cd /app

docker build -t backend .

docker run -d -p 80:80 --restart always backend