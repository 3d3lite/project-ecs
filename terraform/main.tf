module "vpc" {
  source = "./modules/vpc"

  vpc_name             = var.vpc_name
  igw_name             = var.igw_name
  nat_eip_name         = var.nat_eip_name
  nat_gateway_name     = var.nat_gateway_name
  public_rt_name       = var.public_rt_name
  private_rt_name      = var.private_rt_name
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  create_nat_gateway   = var.create_nat_gateway
}

module "sg" {
  source = "./modules/sg"

  alb_sg_name = var.alb_sg_name
  ecs_sg_name = var.ecs_sg_name
  vpc_id      = module.vpc.vpc_id
  app_port    = var.app_port
}

data "aws_route53_zone" "this" {
  name = var.domain_name
}

module "acm" {
  source = "./modules/acm"

  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  route53_zone_id           = data.aws_route53_zone.this.zone_id
}

module "alb" {
  source = "./modules/alb"

  alb_name          = var.alb_name
  target_group_name = var.target_group_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.sg.alb_sg_id
  certificate_arn   = module.acm.certificate_arn
  target_port       = var.app_port
}

module "route53" {
  source = "./modules/route53"

  route53_zone_id = data.aws_route53_zone.this.zone_id
  domain_name     = var.domain_name
  alb_dns_name    = module.alb.alb_dns_name
  alb_zone_id     = module.alb.alb_zone_id
}

module "iam" {
  source = "./modules/iam"
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  log_group_name = var.log_group_name
}

module "ecs" {
  source = "./modules/ecs"

  container_name     = var.container_name
  cluster_name       = var.cluster_name
  service_name       = var.service_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ecs_sg_id          = module.sg.ecs_sg_id
  target_group_arn   = module.alb.target_group_arn
  container_port     = var.app_port
  ecr_repository_url = var.ecr_repository_url
  task_family        = var.task_family
  region             = var.region
  execution_role_arn = module.iam.ecs_task_execution_role_arn
  log_group_name     = module.cloudwatch.log_group_name
}