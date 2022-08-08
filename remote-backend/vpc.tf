provider "aws" {
  version                 = "~> 2.0"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  region                  = "eu-west-3"
}

/*# Backend must remain commented until the Bucket
 and the DynamoDB table are created. 
 After the creation you can uncomment it,
 run "terraform init" and then "terraform apply" */

terraform {
  backend "s3" {
    bucket         = "stn-terraform-state-backend"
    key            = "terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "terraform_state"
    }
    }

resource "aws_vpc" "demo_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  tags = {
    Name = "vpc"
  }
}