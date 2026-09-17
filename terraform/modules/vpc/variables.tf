variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "igw_name" {
  type        = string
  description = "Name of the internet gateway"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets, one per AZ"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones to deploy subnets into"
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