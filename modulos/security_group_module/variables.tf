# security_group_module/variables.tf

variable "security_group_name" {
  description = "Nome do grupo de segurança"
}

variable "vpc_id" {
  description = "ID da VPC onde o grupo de segurança será criado"
}

variable "ingress_rules" {
  description = "Regras de entrada para o grupo de segurança (lista de mapas)"
  type        = list(map(any))
}
