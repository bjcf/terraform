# target_group_module/outputs.tf

output "target_group_arn" {
  description = "ARN do Target Group criado"
  value       = aws_lb_target_group.target_group.arn
}
