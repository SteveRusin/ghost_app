module "vpc" {
  source = "./vpc"
}

module "security_groups" {
  source = "./security-groups"
  depends_on = [
    module.vpc
  ]
  vpc_id     = module.vpc.vpc_id
  my_ip_cidr = local.my_ip_cidr
  vpc_cidr   = module.vpc.vpc_cidr
}

module "ec2" {
  source = "./ec2"
  depends_on = [
    module.vpc,
    module.security_groups,
    module.iam
  ]

  ec2_pool_sg_id        = module.security_groups.ec2_pool_sg_id
  ghost_app_profile_arn = module.iam.ghost_app_profile_arn
  lb_dns_name           = module.alb.lb_dns_name
  target_group_arn      = module.alb.target_group_arn
  subnet_id             = module.vpc.subnet_id
  lb_arn                = module.alb.lb_arn
  bastion_sg_id         = module.security_groups.bastion_sg_id
  db_url                = module.db.db_url
  db_username           = module.db.db_username
  db_name               = module.db.db_name
}

module "iam" {
  source = "./iam"
}

module "efs" {
  source = "./efs"

  subnet_id             = module.vpc.subnet_id
  efs_security_group_id = module.security_groups.efs_sg_id
}

module "alb" {
  source = "./alb"

  vpc_id    = module.vpc.vpc_id
  alb_sg_id = module.security_groups.alb_sg_id
  subnet_id = module.vpc.subnet_id
}

module "db" {
  source = "./db"

  vpc_id         = module.vpc.vpc_id
  gateway_id     = module.vpc.gateway_id
  ec2_pool_sg_id = module.security_groups.ec2_pool_sg_id
}

output "alb_url" {
  value = module.alb.lb_dns_name
}
