# vpc_module/main.tf

variable "vpc_name" {
  description = var.vpc_name
}

variable "cidr_block" {
  description = var.cidr_block
}

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.cidr_block}.0/24" # Substitua pelo bloco de sub-rede desejado
  availability_zone       = "us-east-1a" # Substitua pela zona desejada
  map_public_ip_on_launch = true
}

output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.vpc.id
}

output "public_subnet_id" {
  description = "ID da sub-rede pública criada"
  value       = aws_subnet.public_subnet.id
}
