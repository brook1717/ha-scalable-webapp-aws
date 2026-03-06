variable "ha_w_app" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group for ALB"
  type        = string
}

variable "app_port" {
  description = "Application port"
  type        = number
  default     = 80
}