output "efs_sg_id" {
  value = aws_security_group.efs.id
}

output "alb_sg_id" {
  value = aws_security_group.alb.id
}

output "ec2_pool_sg_id" {
  value = aws_security_group.ec2_pool.id
}