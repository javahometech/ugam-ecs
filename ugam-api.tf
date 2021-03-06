# Create ALB target groups

module "ugam-api-tg" {
  source   = "./modules/alb-target-group"
  app_name = "ugam-api"
  port     = 8080
  vpc_id   = module.ugam-vpc.vpc_id
}

# For service One
module "ugam-s1-task" {
  source           = "./modules/ecs-task-def"
  subnets          = module.ugam-vpc.pub_sub_ids
  vpc_id           = module.ugam-vpc.vpc_id
  cluster_id       = module.ugam-ecs.cluster_id
  target_group_arn = module.ugam-api-tg.target_group_arn
  con_def_config = {
    cpu = 256
    image = "461923016741.dkr.ecr.us-east-1.amazonaws.com/nodeapp:v2"
    memory = 512
    name = "ugam-api"
    port = 8080
  }
}