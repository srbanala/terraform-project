
terraform {
  backend "remote" {
    organization = "docker-nginx"
    workspaces {
      name = "terraform-project"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.27"
    }
  }
  required_version = ">=0.14.9"
}

variable  "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}


provider "aws" {
  profile = "default"
  region  = var.aws_region
}

resource "aws_s3_bucket" "my_bucket" {
  acl = "public-read"
    versioning {
    enabled = true
  }

}