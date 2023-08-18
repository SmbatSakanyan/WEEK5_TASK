resource "aws_launch_configuration" "webserver-launch-config" {
  name_prefix                 = "webserver-launch-config"
  image_id                    = var.ami
  associate_public_ip_address = true
  iam_instance_profile        = var.EC2_profile_name
  instance_type               = var.instance_type
  security_groups             = [var.Sg_id]


  lifecycle {
    create_before_destroy = true
  }
  user_data = file("./USERDATA/user-data-pull.sh")
}

resource "aws_autoscaling_group" "ASG" {
  name             = var.asg_name
  desired_capacity = 2
  max_size         = 4
  min_size         = 1
  #   depends_on           = [var.ALB]
  target_group_arns    = [var.target_group_arn]
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.webserver-launch-config.name
  vpc_zone_identifier  = ["${var.pub_sub_a_id}", "${var.pub_sub_b_id}"]

}
