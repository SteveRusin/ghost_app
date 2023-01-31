variable "ghost_ecs_role" {}

variable "efs_id" {}
variable "alb_ecs_target_group_arn" {}
variable "fargate_pool_sg_id" {}

variable "private_ecs_subnet_id" {
  type = object({
    a = string
    b = string
    c = string
  })
}
