# s3_module/main.tf

variable "bucket_name" {
  description = "Nome do bucket S3"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "private" # Substitua pelo ACL desejado (private, public-read, etc.)
}

output "s3_bucket_name" {
  description = "Nome do bucket S3 criado"
  value       = aws_s3_bucket.s3_bucket.id
}
