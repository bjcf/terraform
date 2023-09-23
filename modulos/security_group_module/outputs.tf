# security_group_module/outputs.tf

output "security_group_id" {
  description = "ID do grupo de segurança criado"
  value       = aws_security_group.security_group.id
}
