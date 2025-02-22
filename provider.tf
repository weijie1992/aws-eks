terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  backend "local" {
    path = "./terraform.tfstate" # Store the state file locally in your project directory
  }
}

provider "aws" {
  region = "ap-southeast-1"

  default_tags {
    tags = {
      Environment = "development"
      ManagedBy   = "Terraform"
    }
  }
}
