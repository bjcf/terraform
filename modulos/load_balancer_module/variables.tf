# load_balancer_module/variables.tf

variable "alb_name" {
  description = "Nome do Application Load Balancer (ALB)"
}

variable "subnets" {
  description = "Lista de IDs das sub-redes onde o ALB será provisionado"
  type        = list(string)
}

variable "listeners" {
  description = "Lista de listeners para o ALB (cada listener é um mapa)"
  type        = list(map(any))
}
