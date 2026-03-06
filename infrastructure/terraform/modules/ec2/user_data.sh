#!/bin/bash
set -xe

# Update system
yum update -y

# Install dependencies
yum install -y python3 git

# Create app directory
mkdir -p /app

# Clone backend repo
git clone https://github.com/brook1717/ha-scalable-webapp-aws.git /app

cd /app/app/simple-backend-api

# Install python packages
pip3 install -r requirements.txt

# Set database environment variables
export DB_HOST=${db_host}
export DB_USER=${db_user}
export DB_PASSWORD=${db_password}
export DB_NAME=${db_name}

# Run the Flask app
python3 app.py