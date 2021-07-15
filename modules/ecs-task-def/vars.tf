variable "app_name" {
  default = "ugam-app"
  type = string
}
variable "task_def_config" {
  type = object({
      network_mode = string
      cpu = string 
      memory = string
      requires_compatibilities = list(string)
  })
  default = {
    cpu = "256"
    memory = "512"
    network_mode = "awsvpc"
    requires_compatibilities = [ "FARGATE" ]
  }
}

variable "con_def_config" {
  type = object({
      name = string
      cpu = number 
      memory = number
      image = string
      port = number
  })
  default = {
    cpu = 256
    image = "kammana/nodeapp:v1"
    memory = 512
    name = "ugam-api"
    port = 8080
  }
}

variable "subnets" {
  type = list(string)
}
variable "vpc_id" {
  
}

variable "cluster_id" {
  
}

variable "target_group_arn" {
  
}