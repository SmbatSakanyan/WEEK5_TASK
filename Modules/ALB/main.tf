resource "aws_lb" "ALB" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.Sg_id]
  subnets            = [var.pub_sub_a_id, var.pub_sub_b_id]

}
resource "aws_lb_target_group" "TG" {
  name = "TG"
  #   depends_on = [aws_vpc.week4_VPC]
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    interval            = 70
    path                = "/login"
    port                = 3000
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 60
    protocol            = "HTTP"
    matcher             = "200"
  }
}
# Create ALB Listener 

resource "aws_lb_listener" "ALB_listener" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG.arn
  }
}

