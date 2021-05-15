module "jenkins_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"
  name = "jenkins_security_group"
  description = "jenkins inbound"
  vpc_id             = module.vpc.vpc_id
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules      = ["all-all"] 
}
