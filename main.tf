
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