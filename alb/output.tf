output "lb_dns_name" {
  value = aws_lb.ghost_app_alb.dns_name
}

output "lb_arn" {
  value = aws_lb.ghost_app_alb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.ghost-ec2.arn
}
