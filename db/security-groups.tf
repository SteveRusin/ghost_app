resource "aws_security_group" "mysql" {
  name        = "mysql"
  description = "defines access to ghost db"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH access to bastion from work pc"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [ var.ec2_pool_sg_id ]
  }
}
