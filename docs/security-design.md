# Security Design

## Overview

This architecture follows a layered security model using Security Group chaining and least privilege access.

Traffic flow:

Internet → ALB → EC2 → RDS

No direct public access is allowed to EC2 or RDS.

## Security Group Structure

### ALB Security Group
- Allows HTTP (80) and HTTPS (443) from 0.0.0.0/0
- Required because it is the public entry point.

### EC2 Security Group
- Allows application port traffic only from ALB Security Group
- No public CIDR access allowed
- Prevents lateral movement and direct exposure

### RDS Security Group
- Allows database port only from EC2 Security Group
- Not publicly accessible
- Prevents direct database exposure



## Least Privilege Model

- No broad CIDR rules for internal tiers
- Security groups reference each other instead of using IP ranges
- Database cannot be accessed from internet
- EC2 cannot be accessed directly from internet

## CIDR Decisions

VPC CIDR: 10.0.0.0/16  
Subnets: /24  

Each /24 provides 251 usable IPs, sufficient for mid-scale workloads while maintaining logical segmentation between public, application, and database tiers.


## Security Considerations for Production

Future improvements may include:
- KMS encryption for RDS
- Secrets Manager for DB credentials
- TLS termination on ALB
- WAF integration