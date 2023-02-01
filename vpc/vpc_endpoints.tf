# todo add sg

# resource "aws_security_group" "vpc_endpoint" {
#   name        = "vpc_endpoint"
#   description = "allow access vpc endpoints"
#   vpc_id      = var.vpc_id
# }

# resource "aws_security_group_rule" "vpc_endpoint_ingress" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   security_group_id = aws_security_group.vpc_endpoint.id
#   source_security_group_id = var.fargate_pool_sg_id
# }

# resource "aws_vpc_endpoint" "s3" {
#   vpc_id       = aws_vpc.cloudx.id
#   service_name = "com.amazonaws.eu-west-1.s3"

#   vpc_endpoint_type  = "Interface"
#   security_group_ids = [var.vpc_endpoint_seg_group_id]
# }

# resource "aws_vpc_endpoint" "ecr_dkr" {
#   vpc_id       = aws_vpc.cloudx.id
#   service_name = "com.amazonaws.eu-west-1.ecr.dkr"

#   vpc_endpoint_type  = "Interface"
#   security_group_ids = [var.vpc_endpoint_seg_group_id]
# }

# resource "aws_vpc_endpoint" "ecr_api" {
#   vpc_id       = aws_vpc.cloudx.id
#   service_name = "com.amazonaws.eu-west-1.ecr.api"

#   vpc_endpoint_type  = "Interface"
#   security_group_ids = [var.vpc_endpoint_seg_group_id]
# }

# resource "aws_vpc_endpoint" "logs" {
#   vpc_id       = aws_vpc.cloudx.id
#   service_name = "com.amazonaws.eu-west-1.logs"

#   vpc_endpoint_type  = "Interface"
#   security_group_ids = [var.vpc_endpoint_seg_group_id]
# }

# resource "aws_vpc_endpoint" "ssm" {
#   vpc_id       = aws_vpc.cloudx.id
#   service_name = "com.amazonaws.eu-west-1.ssm"

#   vpc_endpoint_type  = "Interface"
#   security_group_ids = [var.vpc_endpoint_seg_group_id]
# }

# resource "aws_vpc_endpoint" "elasticfilesystem" {
#   vpc_id       = aws_vpc.cloudx.id
#   service_name = "com.amazonaws.eu-west-1.elasticfilesystem"

#   vpc_endpoint_type  = "Interface"
#   security_group_ids = [var.vpc_endpoint_seg_group_id]
# }
