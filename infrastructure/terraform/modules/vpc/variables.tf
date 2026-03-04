variable "name" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnets_count" {
  description = "Number of public subnets"
  type        = number
}

variable "private_subnets_count" {
  description = "Number of private subnets"
  type        = number
}