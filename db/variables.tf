variable "vpc_id" {}
variable "gateway_id" {}
variable "ec2_pool_sg_id" {}
variable "mysql_seg_group_id" {}
variable "private_db_subnet_id" {
  type = object({
    a = string
    b = string
    c = string
  })
}
variable "aws_db_subnet_group_name" { }
