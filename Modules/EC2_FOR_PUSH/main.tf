resource "aws_ecr_repository" "week4_ecr" {
  name = "week5_ecr"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_instance" "Ec2_for_Ecr" {
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.Sg_id]
  subnet_id                   = var.public_a_id
  iam_instance_profile        = var.EC2_profile_name
  ami                         = var.ami
  instance_type               = var.instance_type
  user_data                   = file("./USERDATA/user-data-push.sh")
}
