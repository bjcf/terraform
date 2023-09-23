# target_group_module/main.tf

variable "target_group_name" {
  description = "Nome do Target Group"
}

variable "target_group_port" {
  description = "Porta alvo para o Target Group"
  default     = 80 # Porta HTTP padrão
}

variable "vpc_id" {
  description = "ID da VPC onde o Target Group será criado"
}

resource "aws_lb_target_group" "target_group" {
  name        = var.target_group_name
  port        = var.target_group_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 5
  }
}

output "target_group_arn" {
  description = "ARN do Target Group criado"
  value       = aws_lb_target_group.target_group.arn
}
