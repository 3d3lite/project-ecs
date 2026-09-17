variable "domain_name" {
  type        = string
  description = "The domain name the certificate will be issued for"
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "Additional domain names to include on the certificate"
  default     = []
}

variable "route53_zone_id" {
  type        = string
  description = "Route53 hosted zone ID used for DNS validation"
}