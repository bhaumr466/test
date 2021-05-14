module "iam" {
    source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "3.6.0"

  name                 = "jenkins_iam"
  role_name               = "jenkins-role"
  create_role             = true
  force_detach_policies   = true
  #custom_role_policy_arns = [module.bastion_iam_policy.arn]
  trusted_role_arns       = ["arn:aws:iam::267756968881:root"]
  role_requires_mfa       = false
  create_instance_profile = true
  #mfa_age                 = 3600


  tags = {
    name        = "jenkins_iam"
    #environment = var.env
    #project     = var.app_name
  }


}
