# rds_module/variables.tf

variable "db_name" {
  description = "Nome do banco de dados RDS"
}

variable "db_instance_identifier" {
  description = "Identificador único da instância RDS"
}

variable "db_instance_class" {
  description = "Classe da instância RDS"
}

variable "db_username" {
  description = "Nome de usuário para acesso ao banco de dados"
}

variable "db_password" {
  description = "Senha para acesso ao banco de dados"
}
