module "vpc" {
  source = "./vpc"
}

module "security_groups" {
  source = "./security-groups"
  depends_on = [
    module.vpc
  ]
  vpc_id = module.vpc.vpc_id
  my_ip_cidr = local.my_ip_cidr
}
