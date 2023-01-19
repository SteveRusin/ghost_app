resource "aws_autoscaling_group" "ghost_ec2_pool" {
  name = "ghost_ec2_pool"
  desired_capacity    = 1
  max_size            = 1
  min_size            = 1
  vpc_zone_identifier = values(var.subnet_id)[*]
  target_group_arns = [ var.target_group_arn ]

  instance_refresh {
    strategy = "Rolling"
  }

  launch_template {
    id      = aws_launch_template.ghost.id
    version = aws_launch_template.ghost.latest_version
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_ghost_app" {
  autoscaling_group_name = aws_autoscaling_group.ghost_ec2_pool.name
  lb_target_group_arn    = var.target_group_arn
}
