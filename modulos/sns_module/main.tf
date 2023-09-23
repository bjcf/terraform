# sns_module/main.tf

variable "topic_name" {
  description = "Nome do tópico SNS"
}

resource "aws_sns_topic" "sns_topic" {
  name = var.topic_name
}

resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn = aws_sns_topic.sns_topic.arn

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicPublish",
        Effect    = "Allow",
        Principal = "*",
        Action    = "sns:Publish",
        Resource  = aws_sns_topic.sns_topic.arn,
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.sns_topic.arn
          }
        }
      }
    ],
  })
}

output "sns_topic_arn" {
  description = "ARN do tópico SNS criado"
  value       = aws_sns_topic.sns_topic.arn
}
