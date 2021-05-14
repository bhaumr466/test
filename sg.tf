module "security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"
  name = default-jenkins
  description = jenkins-group
  ingress_with_cidr_blocks = ["0.0.0.0/0"]
  vpc_id = module.vpc.vpc_id
  #egress_cidr_blocks = var.egress_cidr_blocks
  #egress_rules = var.egress_rules
  #ingress_with_source_security_group_id = var.ingress_with_source_security_group_id
  #ingress_with_self = var.ingress_with_self


#   tags = {
#     environment = var.env
#   }
}
