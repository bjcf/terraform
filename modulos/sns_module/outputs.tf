# sns_module/outputs.tf

output "sns_topic_arn" {
  description = "ARN do tópico SNS criado"
  value       = aws_sns_topic.sns_topic.arn
}
