# Simple Backend API

Minimal backend service used for infrastructure demonstration.

## Endpoints

GET /health
Returns service health status.

GET /db-check
Tests database connectivity with SELECT 1.

## Run Locally

pip install -r requirements.txt
export DB_HOST=localhost
export DB_USER=root
export DB_PASSWORD=password
export DB_NAME=test

python app.py