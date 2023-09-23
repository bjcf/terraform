# vpc_module/outputs.tf

output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.vpc.id
}

output "public_subnet_id" {
  description = "ID da sub-rede pública criada"
  value       = aws_subnet.public_subnet.id
}
