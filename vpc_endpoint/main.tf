resource "aws_vpc_endpoint" "s3" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.eu-west-1.s3"

  vpc_endpoint_type   = "Gateway"
  route_table_ids     = [var.private_rt_id]
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.eu-west-1.ecr.dkr"

  vpc_endpoint_type   = "Interface"
  security_group_ids  = [var.vpc_endpoint_seg_group_id]
  subnet_ids          = [var.private_ecs_subnet_id.a, var.private_ecs_subnet_id.b, var.private_ecs_subnet_id.c]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.eu-west-1.ecr.api"

  vpc_endpoint_type   = "Interface"
  security_group_ids  = [var.vpc_endpoint_seg_group_id]
  subnet_ids          = [var.private_ecs_subnet_id.a, var.private_ecs_subnet_id.b, var.private_ecs_subnet_id.c]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.eu-west-1.logs"

  vpc_endpoint_type   = "Interface"
  security_group_ids  = [var.vpc_endpoint_seg_group_id]
  subnet_ids          = [var.private_ecs_subnet_id.a, var.private_ecs_subnet_id.b, var.private_ecs_subnet_id.c]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.eu-west-1.ssm"

  vpc_endpoint_type   = "Interface"
  security_group_ids  = [var.vpc_endpoint_seg_group_id]
  subnet_ids          = [var.private_ecs_subnet_id.a, var.private_ecs_subnet_id.b, var.private_ecs_subnet_id.c]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "elasticfilesystem" {
  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.eu-west-1.elasticfilesystem"

  vpc_endpoint_type   = "Interface"
  security_group_ids  = [var.vpc_endpoint_seg_group_id]
  subnet_ids          = [var.private_ecs_subnet_id.a, var.private_ecs_subnet_id.b, var.private_ecs_subnet_id.c]
  private_dns_enabled = true
}
