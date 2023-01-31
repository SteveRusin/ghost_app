resource "aws_lb_target_group" "ghost-ec2" {
  name     = "ghost-ec2"
  port     = 2368
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled = true
    path = "/ghost"
    port = 2368
    interval = 15
    matcher = "200,301"
  }
}

resource "aws_lb" "ghost_app_alb" {
  name               = "ghostAppAlb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = values(var.subnet_id)[*]
}

resource "aws_lb_listener" "ghost_app_listener" {
  load_balancer_arn = aws_lb.ghost_app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ghost-ec2.arn
  }
}

resource "aws_lb_listener_rule" "ghost_app_rule" {
  listener_arn = aws_lb_listener.ghost_app_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ghost-ec2.arn
  }

  condition {
    source_ip {
      values = [ "0.0.0.0/0" ]
    }
  }
}

#todo add target groups
# resource "aws_lb_target_group" "ghost-ecs" {
#   name     = "ghost-fargate"
#   port     = 2368
#   protocol = "HTTP"
#   vpc_id   = var.vpc_id

#   health_check {
#     enabled = true
#     path = "/ghost"
#     port = 2368
#     interval = 15
#     matcher = "200,301"
#   }
# }

# resource "aws_lb_listener_rule" "ghost_ecs_rule" {
#   listener_arn = aws_lb_listener.ghost_app_listener.arn
#   priority     = 100

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ghost-ec2.arn
#   }

#   condition {
#     source_ip {
#       values = [ "0.0.0.0/0" ]
#     }
#   }
# }
