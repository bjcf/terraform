# lambda_module/main.tf

variable "function_name" {
  description = "Nome da função Lambda"
}

variable "handler" {
  description = "Nome do arquivo de manipulador (handler)"
  default     = "index.handler"
}

variable "runtime" {
  description = "Tempo de execução da função Lambda"
  default     = "nodejs14.x"
}

variable "source_code" {
  description = "Caminho para o código-fonte da função Lambda (um arquivo ZIP ou diretório)"
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  filename      = var.source_code
  source_code_hash = filebase64sha256(var.source_code)

  # Configurações adicionais, como variáveis de ambiente e permissões, podem ser adicionadas aqui
}

output "lambda_function_name" {
  description = "Nome da função Lambda criada"
  value       = aws_lambda_function.lambda_function.function_name
}
