resource "aws_ecs_task_definition" "service" {
  family                   = "${var.app_name}-${terraform.workspace}-task-def"
  network_mode             = var.task_def_config.network_mode
  execution_role_arn       = aws_iam_role.ecs_task_exe_role.arn
  task_role_arn            = aws_iam_role.ecs_task_exe_role.arn
  requires_compatibilities = var.task_def_config.requires_compatibilities
  cpu                      = var.task_def_config.cpu
  memory                   = var.task_def_config.memory
  container_definitions = jsonencode([
    {
      name      = var.con_def_config.name
      image     = var.con_def_config.image
      cpu       = var.con_def_config.cpu
      memory    = var.con_def_config.memory
      essential = true
      portMappings = [
        {
          containerPort = var.con_def_config.port
          hostPort      = var.con_def_config.port
        }
      ]
    }
  ])
}