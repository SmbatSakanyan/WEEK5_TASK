output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.ALB.dns_name
}
output "target_group_arn" {
  value = aws_lb_target_group.TG.arn
}
