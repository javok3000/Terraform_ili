terraform {
  required_version = ">= 1.0.8"
  required_providers {
    aws = {
      version = ">= 4.15.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = var.region
}

provider "aws" {
  alias   = "acm_provider"
  region  = "us-east-1"
}

data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}