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
    key    = "aws-vm/terraform.tfstate"
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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = ""
    key    = ""
    region = "us-east-1"
  }
}

