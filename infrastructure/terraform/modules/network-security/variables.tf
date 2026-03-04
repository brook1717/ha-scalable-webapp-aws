variable "name" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "app_port" {
  description = "Application port (EC2)"
  type        = number
  default     = 80
}

variable "db_port" {
  description = "Database port"
  type        = number
  default     = 3306
}