
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


resource "aws_s3_bucket" "my_bucket" {
  acl = "public-read"
  versioning {
    enabled = true
  }
  logging {
    target_bucket = "elasticbeanstalk-us-east-1-298693496319"
  }
  }
