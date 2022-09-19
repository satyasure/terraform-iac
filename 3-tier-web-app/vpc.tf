# Creating VPC
resource "aws_vpc" "workshop" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "workshop VPC"
  }
}