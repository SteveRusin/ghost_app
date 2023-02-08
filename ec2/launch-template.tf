resource "aws_launch_template" "ghost" {
  name = "ghost"

  iam_instance_profile {
    arn = var.ghost_app_profile_arn
  }

  image_id = "ami-0fe0b2cf0e1f25c8a" # Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type

  instance_type = "t2.micro"

  key_name               = aws_key_pair.kp.key_name
  vpc_security_group_ids = [var.ec2_pool_sg_id]

  update_default_version = true

  user_data = base64encode(
    templatefile("${path.module}/user-data-script.sh", {
      LB_DNS_NAME = var.lb_dns_name,
      DB_URL = var.db_url,
      DB_NAME = var.db_name
      DB_USER = var.db_username
    })
  )
}
