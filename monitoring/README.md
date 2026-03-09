# CloudWatch Monitoring Dashboard

This project includes a CloudWatch dashboard to visualize system health.

Metrics included:

- ALB request volume
- ALB 5xx errors
- EC2 CPU utilization
- RDS CPU utilization
- RDS connection count

## Import Dashboard

1. Open AWS Console
2. Navigate to CloudWatch
3. Dashboards → Create dashboard
4. Choose **Import JSON**
5. Paste contents of `cloudwatch-dashboard.json`

## Usage

Use this dashboard to:

- Monitor traffic
- Detect application failures
- Identify scaling needs
- Observe database load