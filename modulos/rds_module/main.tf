# rds_module/main.tf

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

resource "aws_db_instance" "rds_instance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql" # Substitua pelo motor de banco de dados desejado
  engine_version       = "5.7"
  name                 = var.db_name
  identifier           = var.db_instance_identifier
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
}
