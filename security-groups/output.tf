output "efs_sg_id" {
  value = aws_security_group.efs.id
}

output "alb_sg_id" {
  value = aws_security_group.alb.id
}

output "ec2_pool_sg_id" {
  value = aws_security_group.ec2_pool.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}

output "fargate_pool_sg_id" {
  value = aws_security_group.fargate_pool.id
}

output "mysql_seg_group_id" {
  value = aws_security_group.mysql.id
}

output "vpc_endpoint_sg_id" {
  value = aws_security_group.vpc_endpoint.id
}
