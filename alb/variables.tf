variable "vpc_id" {}

variable "alb_sg_id" {}

variable "subnet_id" {
  type = object({
    a = string
    b = string
    c = string
  })
}
