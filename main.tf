provider "aws" {
  access_key = "AKIAT4V4PDOYWX7AGW7J"
  secret_key = "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"
  region = "eu-west-1"
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "eu-central-1-eks-dev"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.70.0"

  name                 = "eu-central-1-vpc-dev"
  cidr                 = "20.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["20.0.1.0/24", "20.0.2.0/24", "20.0.3.0/24"]
  public_subnets       = ["20.0.4.0/24", "20.0.5.0/24", "20.0.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_s3_endpoint   = true


  tags = {
    Owner       = "rahul"
    Environment = "dev"
  }
}
