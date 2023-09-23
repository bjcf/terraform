# s3_module/outputs.tf

output "s3_bucket_name" {
  description = "Nome do bucket S3 criado"
  value       = aws_s3_bucket.s3_bucket.id
}
