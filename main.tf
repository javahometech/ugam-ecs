module "ugam-vpc" {
  source   = "git@github.com:javahometech/terraform-modules-ugam//networking?ref=0.0.2"
  app_name = "ecs-ugam"
}

module "ugam-ecs" {
  source = "./modules/ecs"
}
