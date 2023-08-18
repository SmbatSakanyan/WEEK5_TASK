module "VPC" {
  source = "./Modules/VPC"
  VPC    = "Week5_VPC"
}

module "SG" {
  source = "./Modules/SG"
  SG     = "Week5_SG"
  vpc_id = module.VPC.vpc_id
}

module "IAM_ROLE" {
  source   = "./Modules/IAM_ROLE"
  IAM_ROLE = "EC2_role"

}

module "EC2_FOR_PUSH" {
  source           = "./Modules/EC2_FOR_PUSH"
  Sg_id            = module.SG.Sg_id
  public_a_id      = module.VPC.pub_sub_a
  EC2_profile_name = module.IAM_ROLE.instance_profile_name
}

module "ALB" {
  source       = "./Modules/ALB"
  pub_sub_a_id = module.VPC.pub_sub_a
  pub_sub_b_id = module.VPC.pub_sub_b
  Sg_id        = module.SG.Sg_id
  vpc_id       = module.VPC.vpc_id
}

module "ASG" {
  source           = "./Modules/ASG"
  pub_sub_a_id     = module.VPC.pub_sub_a
  pub_sub_b_id     = module.VPC.pub_sub_b
  Sg_id            = module.SG.Sg_id
  EC2_profile_name = module.IAM_ROLE.instance_profile_name
  target_group_arn = module.ALB.target_group_arn
}
