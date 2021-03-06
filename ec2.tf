module "jsg" {
  #source = "terraform-aws-modules/security-group/aws"
  source = "clouddrove/security-group/aws"
  #version = "~> 4.0"
  name = "jenkins_sg"
  description = "jenkins inbound"
  vpc_id             = module.vpc.vpc_id
  #egress_cidr_blocks = ["0.0.0.0/0"]
  #egress_rules       = ["all-all"]
  #ingress_cidr_blocks = ["0.0.0.0/0"]
  #ingress_rules      = ["all-all"]
   allowed_ip    = [module.vpc.vpc_cidr_block, "0.0.0.0/0"]
   allowed_ports = [22]
}


module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "2.16.0"
  name                        = "jenkins-test"
  instance_count              = 1
  ami                         = "ami-0b850cf02cc00fdc8"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [module.jsg.security_group_ids]
  #vpc_security_group_ids      = [module.vpc.default_security_group_id]

  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name                    = "jenkins-test"
  #user_data                   = file("${path.root}/scripts/${var.user_data}")
  #iam_instance_profile        = "jenkins_iam"
  disable_api_termination     = false

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 50
    },
  ]


  tags = {
    created_by  = "Terraform"
  }
}
