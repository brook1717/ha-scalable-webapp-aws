# Deployment Guide

This document explains how to deploy the highly available web application infrastructure using Terraform.

---

# Prerequisites

Install:

- Terraform
- AWS CLI
- configured AWS credentials

Verify access:

aws sts get-caller-identity

---

# Step 1 — Initialize Terraform

Initialize the Terraform backend and download providers.

terraform init -backend-config="bucket=ha-webapp-terraform-state"

---

# Step 2 — Plan Infrastructure

Preview the infrastructure changes before deployment.

terraform plan -var-file=env.tfvars

This command shows:

- resources to create
- resources to modify
- resources to destroy

---

# Step 3 — Deploy Infrastructure

Apply the infrastructure changes.

terraform apply -auto-approve -var-file=env.tfvars

Terraform will provision:

- VPC
- Load Balancer
- EC2 Auto Scaling group
- RDS database
- CloudWatch monitoring
- IAM roles
- KMS encryption

---

# Step 4 — Verify Deployment

After deployment:

1. Access the ALB DNS endpoint
2. Check /health endpoint
3. Verify instances are healthy in the target group
4. Confirm metrics appear in CloudWatch dashboard

---

# Rollback Strategy

If a deployment introduces issues:

terraform destroy -var-file=env.tfvars

or revert the Git commit and re-run terraform apply.

---

# Rotating Database Credentials

Database credentials should be stored in AWS Secrets Manager.

Rotation process:

1. Update secret in Secrets Manager
2. Restart application instances
3. Confirm successful DB connection

---

# CI/CD Integration

Pull requests trigger Terraform validation through GitHub Actions.

This ensures infrastructure code is verified before merging to main.