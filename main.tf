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
