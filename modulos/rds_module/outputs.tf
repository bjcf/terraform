# rds_module/outputs.tf

output "rds_instance_endpoint" {
  description = "Endpoint da instância RDS"
  value       = aws_db_instance.rds_instance.endpoint
}

output "rds_instance_id" {
  description = "ID da instância RDS criada"
  value       = aws_db_instance.rds_instance.id
}
