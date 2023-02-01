resource "aws_ecs_cluster" "ghost" {
  name = "ghost"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "task_def_ghost" {
  family                   = "task_def_ghost"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = var.ghost_ecs_role
  execution_role_arn       = var.ghost_ecs_role
  network_mode             = "awsvpc"
  memory                   = 1024
  cpu                      = 256

  volume {
    name = "ghost_volume"
    efs_volume_configuration {
      file_system_id = var.efs_id
    }
  }

  container_definitions = data.template_file.container_definitions.rendered
}

data "template_file" "container_definitions" {
  template = file("${path.module}/container_definition.json")

  vars = {
    "ECR_IMAGE"   = "769832282011.dkr.ecr.eu-west-1.amazonaws.com/ghost:4.12"
    "DB_URL"      = "222" // todo add db
    "DB_USER"     = "333"
    "DB_PASSWORD" = "4444"
    "DB_NAME"     = "555"
    "CLOUDWATCH_GROUP" = aws_cloudwatch_log_group.ghost-ecs-logs.name
  }
}

resource "aws_cloudwatch_log_group" "ghost-ecs-logs" {
  name = "ghost-ecs-logs"
}

resource "aws_ecs_service" "ghost" {
  name        = "ghost"
  launch_type = "FARGATE"

  task_definition = aws_ecs_task_definition.task_def_ghost.arn
  cluster         = aws_ecs_cluster.ghost.id
  desired_count   = 1

  load_balancer {
    target_group_arn = var.alb_ecs_target_group_arn
    container_name   = "task_def_ghost"
    container_port   = 2368
  }

  network_configuration {
    assign_public_ip = false
    security_groups  = [var.fargate_pool_sg_id]
    subnets          = [var.private_ecs_subnet_id.a, var.private_ecs_subnet_id.b, var.private_ecs_subnet_id.c]
  }
}

output "template_file" {
  value = data.template_file.container_definitions.rendered
}
