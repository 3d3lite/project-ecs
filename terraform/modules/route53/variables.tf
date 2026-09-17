variable "route53_zone_id" {
  type        = string
  description = "Route53 hosted zone ID to create the app record in"
}

variable "subdomain" {
  type        = string
  description = "Subdomain prefix for the app record"
  default     = "app"
}

variable "domain_name" {
  type        = string
  description = "The registered domain name"
}

variable "alb_dns_name" {
  type        = string
  description = "DNS name of the ALB to alias to"
}

variable "alb_zone_id" {
  type        = string
  description = "Hosted zone ID of the ALB"
}