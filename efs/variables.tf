variable "efs_security_group_id" {}

variable "subnet_id" {
  type = object({
    a = string
    b = string
    c = string
  })
}
