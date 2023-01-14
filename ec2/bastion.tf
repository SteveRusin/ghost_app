resource "aws_instance" "bastion" {
  ami                         = "ami-0fe0b2cf0e1f25c8a"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.bastion_sg_id]
  key_name                    = aws_key_pair.kp.key_name
  subnet_id                   = var.subnet_id.a

  tags = {
    Name = "bastion"
  }
}
