variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs the ALB will be deployed across"
}

variable "alb_sg_id" {
  type        = string
  description = "Security group ID to attach to the ALB"
}

variable "target_group_name" {
  type        = string
  description = "Name of the ALB target group"
}

variable "target_port" {
  type        = number
  description = "Port the target group forwards traffic to on the ECS task"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the ALB and target group will be created"
}

variable "health_check_path" {
  type        = string
  description = "Path used by the target group health check"
  default     = "/"
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for the HTTPS listener"
}