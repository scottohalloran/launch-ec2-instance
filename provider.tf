provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      }

    archive = {
      source  = "hashicorp/archive"
      }
  }

  
}
