# ec2_module/outputs.tf

output "instance_id" {
  description = "ID da instância EC2 criada"
  value       = aws_instance.ec2_instance.id
}

output "public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.ec2_instance.public_ip
}
