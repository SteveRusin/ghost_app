variable "ec2_pool_sg_id" {}
variable "bastion_sg_id" {}

variable "ghost_app_profile_arn" {}

variable "lb_dns_name" {}
variable "lb_arn" {}

variable "target_group_arn" {}

variable "subnet_id" {
  type = object({
    a = string
    b = string
    c = string
  })
}

variable "db_username" {}
variable "db_name" {}

variable "db_url" {}
