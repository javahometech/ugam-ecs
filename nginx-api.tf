module "ugam-nginx-tg" {
  source   = "./modules/alb-target-group"
  app_name = "ugam-s2-api"
  port     = 80
  vpc_id   = module.ugam-vpc.vpc_id
}


# For service Two

module "ugam-s2-task" {
  source = "./modules/ecs-task-def"
  target_group_arn      = module.ugam-nginx-tg.target_group_arn
  con_def_config = {
    cpu = 512
    image = "nginx:1.21"
    memory = 1024
    name = "ugam-nginx"
    port = 80
  }
  task_def_config = {
    cpu = "512"
    memory = "1024"
    network_mode = "awsvpc"
    requires_compatibilities = [ "FARGATE" ]
  }
  subnets               = module.ugam-vpc.pub_sub_ids
  vpc_id                = module.ugam-vpc.vpc_id
  cluster_id            = module.ugam-ecs.cluster_id
  app_name              = "ugam-s2-api"
}