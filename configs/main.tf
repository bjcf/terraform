# main.tf

# Configuração do provider AWS
provider "aws" {
  region = "us-east-1" # Substitua pela região desejada
}

# Definição da VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16" # Substitua pelo bloco CIDR desejado
  enable_dns_support = true
  enable_dns_hostnames = true
}

# Definição de uma Subnet pública
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24" # Substitua pelo bloco CIDR desejado
  availability_zone       = "us-east-1a" # Substitua pela zona desejada
  map_public_ip_on_launch = true
}

# Definição de um grupo de segurança para a instância EC2
resource "aws_security_group" "ec2_security_group" {
  name        = "ec2-sg"
  description = "Security group for EC2"
  
  # Adicione regras de entrada aqui, como permitir SSH, HTTP, etc.
}

# Definição da instância EC2
resource "aws_instance" "ec2_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Substitua pelo ID da AMI desejada
  instance_type = "t2.micro"              # Substitua pelo tipo de instância desejado
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.ec2_security_group.name]

  # Defina a chave pública para acesso SSH
  key_name = "my-key" # Substitua pelo nome da chave SSH
}

# Definição do banco de dados RDS
resource "aws_db_instance" "rds_instance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql" # Substitua pelo motor de banco de dados desejado
  engine_version       = "5.7"
  instance_class       = "db.t2.micro" # Substitua pelo tipo de instância desejado
  name                 = "mydb"
  username             = "admin"
  password             = "password"
  
  # Configurações adicionais do banco de dados
}

# Saídas para informações úteis
output "ec2_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

