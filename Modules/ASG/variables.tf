variable "pub_sub_a_id" {
  default = ""
}

variable "pub_sub_b_id" {
  default = ""
}

variable "Sg_id" {
  default = ""
}

variable "ami" {
  default = "ami-03f65b8614a860c29"
}

variable "target_group_arn" {
  default = ""
}

variable "instance_type" {
  default = "t2.micro"
}

variable "EC2_profile_name" {
  default = ""
}

variable "asg_name" {
  default = "ASG"
}