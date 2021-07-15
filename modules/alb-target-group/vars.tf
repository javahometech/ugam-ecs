variable "vpc_id" {
  
}
variable "app_name" {
  default = "ugam-app"
}
variable "healthy_threshold" {
  default = 2
}
variable "unhealthy_threshold" {
  default = 2
}
variable "interval" {
  default = 30
}
variable "port" {
  default = 80
}
variable "protocol" {
  default = "HTTP"
}
variable "path" {
  default = "/"
}