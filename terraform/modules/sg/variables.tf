variable "alb_sg_name" {
  type        = string
  description = "Name of the ALB security group"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID tAhe security groups will be created in"
}

variable "ecs_sg_name" {
  type        = string
  description = "Name of the ECS security group"
}

variable "app_port" {
  type        = number
  description = "Port the application container listens on"
  default     = 3000
}