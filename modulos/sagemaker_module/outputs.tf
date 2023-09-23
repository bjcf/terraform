# sagemaker_module/outputs.tf

output "sagemaker_instance_name" {
  description = "Nome da instância SageMaker criada"
  value       = aws_sagemaker_notebook_instance.sagemaker_instance.name
}
