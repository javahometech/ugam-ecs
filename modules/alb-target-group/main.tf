resource "aws_lb_target_group" "main" {
  name     = "${var.app_name}-${terraform.workspace}-tg"
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
  target_type = "ip"
  health_check {
    healthy_threshold = var.healthy_threshold
    interval = var.interval
    path = var.path
    port = var.port
    protocol = var.protocol
    unhealthy_threshold = var.unhealthy_threshold
  }
}