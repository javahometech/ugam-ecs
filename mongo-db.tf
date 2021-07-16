module "ugam-mongo-tg" {
  source   = "./modules/alb-target-group"
  app_name = "ugam-s3-db"
  port     = 27017
  vpc_id   = module.ugam-vpc.vpc_id
}


# For service Two

module "ugam-s3-task" {
  source           = "./modules/ecs-task-def"
  target_group_arn = module.ugam-mongo-tg.target_group_arn
  desired_count    = 3
  con_def_config = {
    cpu    = 512
    image  = "mongo:5.0.0"
    memory = 1024
    name   = "ugam-mongo"
    port   = 27017
  }
  task_def_config = {
    cpu                      = "512"
    memory                   = "1024"
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
  }
  subnets    = module.ugam-vpc.pub_sub_ids
  vpc_id     = module.ugam-vpc.vpc_id
  cluster_id = module.ugam-ecs.cluster_id
  app_name   = "ugam-s3-db"
}