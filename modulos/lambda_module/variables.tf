# lambda_module/variables.tf

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
