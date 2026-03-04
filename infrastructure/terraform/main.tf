//Provider
provider "aws" {
  region = var.region
}

//VPC Module Call
module "vpc" {
  source = "./modules/vpc"

  name  = var.name
  env   = var.env
  cidr  = "10.0.0.0/16"

  azs = [
    "${var.region}a",
    "${var.region}b"
  ]

  public_subnets_count  = 2
  private_subnets_count = 2
}