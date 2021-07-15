# Create ALB for targets

module "alb" {
  source         = "./modules/alb"
  subnet_ids     = module.ugam-vpc.pub_sub_ids
  vpc_id         = module.ugam-vpc.vpc_id
  default_tg_arn = module.ugam-api-tg.target_group_arn
  listner_rules = {
    "orders" = {
      path_pattern = [ "/nginx*" ]
      priority = 1
      target_group_arn = module.ugam-nginx-tg.target_group_arn
    }
  }
}