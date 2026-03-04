# VPC Module

Reusable VPC module for multi-AZ highly available architecture.

## Features
- Custom CIDR
- Public & Private subnets
- Internet Gateway
- NAT Gateway per AZ
- Route tables with proper associations

## Example Usage

module "vpc" {
  source = "./modules/vpc"

  name  = "ha-webapp"
  env   = "dev"
  cidr  = "10.0.0.0/16"

  azs                     = ["us-east-1a", "us-east-1b"]
  public_subnets_count    = 2
  private_subnets_count   = 2
}