module "endpoints" {
  source = "../.."

  aws_region = var.aws_region
  vpc        = var.vpc
  endpoints  = ["ssm", "ssmmessages", "ec2messages"]
}

variable "aws_region" {
  description = "AWS region application for the endpoint"
}

variable "vpc" {
  description = "Name of the VPC to deploy to"
  default     = null
}