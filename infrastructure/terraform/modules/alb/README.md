# ALB Module

Creates an Application Load Balancer with an HTTP listener and target group.

# Features
- Internet-facing ALB
- Health check endpoint `/health`
- Target group for EC2 instances
- Security group integration

# Example Usage
module "alb" {
  source = "./modules/alb"

  name              = "ha-webapp"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.network_security.alb_sg_id
}