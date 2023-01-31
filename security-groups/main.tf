resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "allow access to bastion"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH access to bastion from work pc"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]
  }

  egress {
    description = "allow any destination"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ec2_pool" {
  name        = "ec2_pool"
  description = "allow access to ec2 instances"
  vpc_id      = var.vpc_id
}

resource "aws_security_group" "alb" {
  name        = "alb"
  description = "allow access to alb"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress_to_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [var.my_ip_cidr]
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "egress_from_alb" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.ec2_pool.id
}

resource "aws_security_group_rule" "ingress_alb_to_ec2_pool" {
  description              = "inbound trafic from alb"
  type                     = "ingress"
  from_port                = 2368
  to_port                  = 2368
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ec2_pool.id
  source_security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "ingres_from_bastion" {
  type                     = "ingress"
  description              = "SSH access from bastion from work pc"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion.id
  security_group_id        = aws_security_group.ec2_pool.id
}

resource "aws_security_group_rule" "ingress_efs_to_ec2" {
  type              = "ingress"
  description       = "allow EFS to access ec2"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr]
  security_group_id = aws_security_group.ec2_pool.id
}

resource "aws_security_group_rule" "egress_ec2_any" {
  type              = "egress"
  description       = "allow any destination"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_pool.id
}

resource "aws_security_group" "efs" {
  name        = "efs"
  description = "defines access to efs mount points"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress_efs" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.ec2_pool.id
  security_group_id        = aws_security_group.efs.id
}

resource "aws_security_group_rule" "egress_efs" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [var.vpc_cidr]
  security_group_id = aws_security_group.efs.id
}

resource "aws_security_group_rule" "fargate_efs" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id        = aws_security_group.efs.id
  source_security_group_id = aws_security_group.fargate_pool.id
}

resource "aws_security_group" "fargate_pool" {
  name        = "fargate_pool"
  description = "allow access to Fargate instances"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress_fargate_efs" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.efs.id
  security_group_id        = aws_security_group.fargate_pool.id
}

resource "aws_security_group_rule" "ingress_fargate_alb" {
  type                     = "ingress"
  from_port                = 2368
  to_port                  = 2368
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb.id
  security_group_id        = aws_security_group.fargate_pool.id
}

resource "aws_security_group_rule" "egress_fargate" {
  type              = "egress"
  description       = "allow any destination"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.fargate_pool.id
}

resource "aws_security_group" "mysql" {
  name        = "mysql"
  description = "defines access to ghost db"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "msql_ingress" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.mysql.id
  source_security_group_id = aws_security_group.ec2_pool.id
}
