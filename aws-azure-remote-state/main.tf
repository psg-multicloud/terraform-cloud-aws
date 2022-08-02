terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.24.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.16.0"
    }
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

provider "azurerm" {
  features {}
}

