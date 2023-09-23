# target_group_module/variables.tf

variable "target_group_name" {
  description = "Nome do Target Group"
}

variable "target_group_port" {
  description = "Porta alvo para o Target Group"
  default     = 80 # Porta HTTP padrão
}

variable "vpc_id" {
  description = "ID da VPC onde o Target Group será criado"
}
