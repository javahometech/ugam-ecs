# Create ECS Cluster
resource "aws_ecs_cluster" "main" {
  name               = "${var.app_name}-${terraform.workspace}-cluster"
  capacity_providers = ["FARGATE"]

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}