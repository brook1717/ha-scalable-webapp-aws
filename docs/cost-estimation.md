# Cost Estimation

This document provides an estimated monthly cost for the highly available web application infrastructure.

Prices are approximate and based on typical usage in AWS.

---

## Infrastructure Components

| Service | Configuration | Estimated Monthly Cost |
|--------|---------------|------------------------|
| EC2 | 2 × t3.micro instances | ~$17 |
| RDS | db.t3.micro Multi-AZ | ~$30 |
| ALB | Application Load Balancer | ~$18 |
| NAT Gateway | 1 gateway | ~$32 |
| EBS | 20GB storage | ~$2 |
| CloudWatch | logs + metrics | ~$5 |

Estimated total monthly cost:

**~$100 – $120 / month**

---

## Cost Optimization Options

### 1️⃣ Right-Sizing
Reduce instance sizes if utilization is low.

Example:
t3.micro → t3.nano

---

### 2️⃣ Reserved Instances
Use reserved pricing for predictable workloads.

Savings:
Up to **40-60%** compared to on-demand.

---

### 3️⃣ Spot Instances
Use Spot for non-critical workloads.

Savings:
Up to **70-90%**.

---

### 4️⃣ Auto Scaling

Auto Scaling ensures that the infrastructure only runs the number of instances required for the current load.

Min: 2  
Desired: 2  
Max: 6

This prevents over-provisioning.

---

## Monitoring Costs

Costs can be monitored using:

- AWS Cost Explorer
- AWS Budgets
- CloudWatch alarms

---

## Notes

This architecture prioritizes **high availability** and **resilience**.

For development environments, cost can be reduced by:

- disabling Multi-AZ RDS
- using only 1 EC2 instance
- removing the NAT gateway