terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "cloud-module-may25-tf-state"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
    profile = "craigcyf"
  }
}

provider "aws" {
  region = "eu-west-1"
  profile = "craigcyf"
}