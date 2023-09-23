# lambda_module/outputs.tf

output "lambda_function_name" {
  description = "Nome da função Lambda criada"
  value       = aws_lambda_function.lambda_function.function_name
}

