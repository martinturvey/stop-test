terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  default_tags {
    tags = {
      Project = var.project_tag
      Stack   = "stop-test"
    }
  }
  region = var.aws_region
}
