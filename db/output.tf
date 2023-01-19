output "db_username" {
  value = aws_db_instance.ghost.username
}

output "db_url" {
  value = aws_db_instance.ghost.address
}

output "db_name" {
  value = aws_db_instance.ghost.name
}
