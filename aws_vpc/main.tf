terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.24.0"
    }

  }
  backend "s3" {
    bucket = "patriciagois-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "patriciagois"
      managed-by = "terraform"
    }
  }
}


