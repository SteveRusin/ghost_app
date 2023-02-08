terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.3"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}
