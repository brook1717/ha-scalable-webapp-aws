# IAM Module

This module creates least-privilege IAM roles for EC2 instances.

Permissions included:

- CloudWatch Logs write access
- Read access to SSM parameters

Principle:

Least privilege — instances only receive permissions required to run the application and publish logs.

The role is attached through an EC2 instance profile and used in the launch template.