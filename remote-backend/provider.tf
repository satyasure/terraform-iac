terraform {
    required_version = "~> 1.2.4"
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    
      }
      random = {
        source = "hashicorp/random"
        version = "3.3.2"
      }
    }
}
provider "aws" {
    region = "eu-west-3"
    profile = "default"
  
}