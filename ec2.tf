module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "2.16.0"
  name                        = "jenkins-test"
  instance_count              = 1
  ami                         = "ami-0b850cf02cc00fdc8"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [module.jenkins_security_group.jenkins_security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name                    = "jenkins-test"
  #user_data                   = file("${path.root}/scripts/${var.user_data}")
  #iam_instance_profile        = "jenkins_iam"
  disable_api_termination     = true

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 50
    },
  ]


  tags = {
    created_by  = "Terraform"
    #name        = "${var.env}_${var.app_name}_vpc"
    #environment = var.env
    #project     = var.app_name
  }
}
