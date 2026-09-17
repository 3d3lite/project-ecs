# SHARED / GLOBAL
variable "domain_name" {
  type        = string
  description = "The registered domain name"
}

variable "app_port" {
  type        = number
  description = "Port the application container listens on across sg, alb, and ecs modules"
  default     = 3000
}

variable "ecr_repository_url" {
  type        = string
  description = "URL of the manually-created ECR repository"
}

variable "region" {
  type        = string
  description = "AWS region used across the provider and ecs modules"
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "Additional domain names for the ACM certificate"
  default     = []
}


# VPC
variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "igw_name" {
  type        = string
  description = "Name of the internet gateway"
}

variable "nat_eip_name" {
  type        = string
  description = "Name of the NAT gateway's Elastic IP"
}

variable "nat_gateway_name" {
  type        = string
  description = "Name of the NAT gateway"
}

variable "public_rt_name" {
  type        = string
  description = "Name of the public route table"
}

variable "private_rt_name" {
  type        = string
  description = "Name of the private route table"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones to deploy subnets into"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets, one per AZ"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets, one per AZ"
}

variable "create_nat_gateway" {
  type        = bool
  description = "Whether to create a NAT Gateway for private subnet outbound access"
  default     = true
}


# SG
variable "alb_sg_name" {
  type        = string
  description = "Name of the ALB security group"
}

variable "ecs_sg_name" {
  type        = string
  description = "Name of the ECS security group"
}


# ALB
variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
}

variable "target_group_name" {
  type        = string
  description = "Name of the ALB target group"
}


# CLOUDWATCH
variable "log_group_name" {
  type        = string
  description = "Name of the CloudWatch log group"
}


# ECS
variable "task_family" {
  type        = string
  description = "Family name for the ECS task definition"
}

variable "container_name" {
  type        = string
  description = "Name of the container within the task definition"
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}