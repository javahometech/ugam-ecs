resource "aws_ecs_service" "main" {
  name            = "${var.app_name}-${terraform.workspace}-service"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.service.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"
  # iam_role        = aws_iam_role.ecs_role.arn
  # iam_role = "arn:aws:iam::461923016741:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
  # depends_on      = [aws_iam_role_policy.ecs_service_policy]

  network_configuration {
    subnets          = var.subnets
    assign_public_ip = true
    security_groups = [aws_security_group.main.id]
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.con_def_config.name
    container_port   = var.con_def_config.port
  }

}

resource "aws_security_group" "main" {
  name        = "${var.app_name}-${terraform.workspace}-service-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}