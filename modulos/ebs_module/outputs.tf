# ebs_module/outputs.tf

output "ebs_volume_id" {
  description = "ID do volume EBS criado"
  value       = aws_ebs_volume.ebs_volume.id
}