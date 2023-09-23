# load_balancer_module/outputs.tf

output "alb_dns_name" {
  description = "DNS Name do Application Load Balancer (ALB) criado"
  value       = aws_lb.alb.dns_name
}
