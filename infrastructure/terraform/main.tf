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
//rds
module "rds" {
  source = "./modules/rds"

  name = var.name

  db_subnet_ids = module.vpc.private_subnet_ids
  rds_sg_id     = module.vpc.rds_sg_id

  db_name     = var.db_name
  db_username = var.db_user
  db_password = var.db_password
}

//ec2
module "ec2" {
  source = "./modules/ec2"

  name= "webapp"
  ami_id= var.ami_id
  instance_type = "t3.micro"

  ec2_sg_id = module.vpc.ec2_sg_id

  private_subnet_ids = module.vpc.private_subnet_ids
  target_group_arn   = module.vpc.target_group_arn

  db_host     = module.rds.db_endpoint
  db_user     = var.db_user
  db_password = var.db_password
  db_name     = var.db_name
}