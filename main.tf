provider "aws" {
  access_key = "AKIAT4V4PDOYWX7AGW7J"
  secret_key = "mq0TVgSOFxCfjmTWLs41oYoE6x+TLkLPc6bqtmdB"
  region = "eu-west-1"
}

resource "vpc" "My_VPC" {
  #source = "./variable"

  name = "simple-example"

  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_ipv6 = false

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "rahul"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-name"
  }
}