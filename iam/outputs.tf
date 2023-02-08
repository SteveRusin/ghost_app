output "ghost_app_profile_arn" {
  value = aws_iam_instance_profile.ghost_app_profile.arn
}

output "ghost_ecs_role" {
  value = aws_iam_role.ghost_ecs.arn
}
