#!/bin/bash

# Simple load test against ALB endpoint
ALB_URL=$1
REQUESTS=100

if [ -z "$ALB_URL" ]; then
  echo "Usage: ./load-test.sh <ALB_URL>"
  exit 1
fi

echo "Starting load test on $ALB_URL"

for i in $(seq 1 $REQUESTS)
do
  curl -s -o /dev/null -w "%{http_code}\n" "$ALB_URL/health" &
done

wait

echo "Load test completed."