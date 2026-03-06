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