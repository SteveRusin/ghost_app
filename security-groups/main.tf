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
