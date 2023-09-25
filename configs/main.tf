# main.tf

provider "aws" {
  region = "us-east-1" # Substitua pela região desejada
}

module "my_vpc" {
  source     = "../modulos/vpc_module" # Caminho para o diretório do módulo
  vpc_name   = var.vpc_name # Substitua pelo nome da VPC desejada
  cidr_block = var.cidr_block # Substitua pelo bloco CIDR desejado
}

output "vpc_id" {
  value = module.my_vpc.vpc_id
}

output "public_subnet_id" {
  value = module.my_vpc.public_subnet_id
}
