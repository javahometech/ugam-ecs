output "task_def_arn" {
  value = aws_ecs_task_definition.service.arn
}

output "service_name" {
  value = aws_ecs_service.main.name
}