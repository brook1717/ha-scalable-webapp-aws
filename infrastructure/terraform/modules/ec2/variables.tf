variable "name" {
  type = string
}

variable "ami_id" {
  description = "AMI for EC2 instances"
  type        = string
}

variable "instance_type" {
  default = "t3.micro"
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

variable "ec2_sg_id" {
  type = string
}
variable "db_host" {
  description = "RDS database endpoint"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}