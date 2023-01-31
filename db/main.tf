resource "aws_db_instance" "ghost" {
  allocated_storage      = 20
  db_name                = "ghost"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  username               = "admin"
  db_subnet_group_name   = var.aws_db_subnet_group_name
  password               = random_password.db_pwd.result
  vpc_security_group_ids = [var.mysql_seg_group_id]
  skip_final_snapshot    = true
}

resource "random_password" "db_pwd" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_ssm_parameter" "db_pwd" {
  name        = "/ghost/dbpassw"
  description = "password to ghost db"
  type        = "SecureString"
  value       = random_password.db_pwd.result
}
