variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "task_family" {
  type        = string
  description = "Family name for the ECS task definition"
}

variable "task_cpu" {
  type        = number
  description = "CPU units allocated to the task"
  default     = 256
}

variable "task_memory" {
  type        = number
  description = "Memory (MiB) allocated to the task"
  default     = 512
}

variable "execution_role_arn" {
  type        = string
  description = "ARN of the ECS task execution role, from the iam module"
}

variable "container_name" {
  type        = string
  description = "Name of the container within the task definition"
}

variable "ecr_repository_url" {
  type        = string
  description = "URL of the ECR repository"
}

variable "image_tag" {
  type        = string
  description = "Tag of the Docker image to deploy from ECR"
  default     = "latest"
}

variable "container_port" {
  type        = number
  description = "Port the application container listens on"
}

variable "log_group_name" {
  type        = string
  description = "Name of the CloudWatch log group to write ECS logs to"
}

variable "region" {
  type        = string
  description = "AWS region the ECS resources are deployed in"
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "desired_count" {
  type        = number
  description = "Number of ECS tasks to run"
  default     = 1
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs the ECS tasks will run in"
}

variable "ecs_sg_id" {
  type        = string
  description = "Security group ID to attach to the ECS tasks"
}

variable "target_group_arn" {
  type        = string
  description = "ALB target group ARN the ECS service registers tasks with"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID the ECS service will run in"
}