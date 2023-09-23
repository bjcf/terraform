# sagemaker_module/main.tf

variable "instance_name" {
  description = "Nome da instância SageMaker"
}

resource "aws_sagemaker_notebook_instance" "sagemaker_instance" {
  name            = var.instance_name
  instance_type   = "ml.t2.medium" # Substitua pelo tipo de instância desejado
  role_arn        = "arn:aws:iam::123456789012:role/service-role/AmazonSageMaker-ExecutionRole-20210101T000001" # Substitua pelo ARN da função IAM desejada
}
