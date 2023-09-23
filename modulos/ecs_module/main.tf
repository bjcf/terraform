# ecs_module/main.tf

variable "cluster_name" {
  description = "Nome do cluster ECS"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "my-ecs-task" # Substitua pelo nome da definição de tarefa desejada
  network_mode             = "bridge" # Substitua pelo modo de rede desejado
  requires_compatibilities = ["FARGATE"]
  execution_role_arn        = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole" # Substitua pelo ARN da função IAM desejada

  container_definitions = jsonencode([
    {
      name  = "my-container" # Substitua pelo nome do contêiner desejado
      image = "nginx:latest" # Substitua pela imagem do Docker desejada
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        },
      ]
    },
  ])
}

resource "aws_ecs_service" "ecs_service" {
  name            = "my-ecs-service" # Substitua pelo nome do serviço desejado
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  launch_type     = "FARGATE"
  network_configuration {
    subnets = ["subnet-12345678", "subnet-23456789"] # Substitua pelas sub-redes desejadas
    security_groups = ["sg-12345678"] # Substitua pelo grupo de segurança desejado
  }
}
