resource "aws_efs_file_system" "ghost_content" {

  tags = {
    Name = "ghost_content"
  }
}

resource "aws_efs_mount_target" "a" {
  file_system_id  = aws_efs_file_system.ghost_content.id
  security_groups = [var.efs_security_group_id]
  subnet_id       = var.subnet_id.a
}

resource "aws_efs_mount_target" "b" {
  file_system_id  = aws_efs_file_system.ghost_content.id
  security_groups =[var.efs_security_group_id]
  subnet_id       = var.subnet_id.b
}

resource "aws_efs_mount_target" "c" {
  file_system_id  = aws_efs_file_system.ghost_content.id
  security_groups = [var.efs_security_group_id]
  subnet_id       = var.subnet_id.c
}
