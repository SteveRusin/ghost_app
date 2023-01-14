resource "aws_efs_file_system" "ghost_content" {

  tags = {
    Name = "ghost_content"
  }
}

resource "aws_efs_mount_target" "targets" {
  file_system_id  = aws_efs_file_system.ghost_content.id
  security_groups = [var.efs_security_group_id]
  subnet_id       = each.value

  for_each = var.subnet_id
}
