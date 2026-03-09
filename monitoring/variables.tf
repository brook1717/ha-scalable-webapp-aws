variable "name" {
  type = string
}

variable "alert_email" {
  description = "Email to receive CloudWatch alerts"
  type        = string
}
variable "alb_name" {
  type = string
}

variable "asg_name" {
  type = string
}

variable "db_identifier" {
  type = string
}