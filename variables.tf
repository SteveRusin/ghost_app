variable "my_ip" {
  type        = string
  description = "My workstation ip"
  default     = "93.178.253.234"
}

locals {
  my_ip_cidr = format("%s/%s", var.my_ip, "32")
}
