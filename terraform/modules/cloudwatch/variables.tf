variable "log_group_name" {
  type        = string
  description = "Name of the CloudWatch log group"
}

variable "retention_in_days" {
  type        = number
  description = "Number of days to retain ECS logs"
  default     = 7
}