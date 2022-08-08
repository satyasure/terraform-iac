variable "aws_region" {
  description = "AWS region application for the endpoint"
}

variable "endpoints" {
  description = "A list of endpoint identifiers to enable"
  type        = list(string)
  default     = []
}

variable "vpc" {
  description = "Name of the VPC to deploy to"
  default     = null
}
