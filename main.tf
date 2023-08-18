module "VPC" {
  source = "./Modules/VPC"
  VPC    = "Week5_VPC"
}

module "SG" {
  source = "./Modules/SG"
  SG     = "Week5_SG"
  vpc_id = module.VPC.vpc_id
}
