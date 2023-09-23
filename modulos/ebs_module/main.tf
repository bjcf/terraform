# ebs_module/main.tf

variable "ebs_device_name" {
  description = "Nome do dispositivo EBS (por exemplo, /dev/sdf)"
}

variable "ebs_volume_size" {
  description = "Tamanho do volume EBS em GB"
}

variable "ebs_volume_type" {
  description = "Tipo do volume EBS (por exemplo, gp2)"
  default     = "gp2"
}

variable "ebs_iops" {
  description = "Número de operações de I/O por segundo (IOPS) (opcional)"
  default     = 100
}

variable "ebs_instance_id" {
  description = "ID da instância EC2 à qual o volume EBS será anexado"
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = var.ebs_device_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = var.ebs_instance_id
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size             = var.ebs_volume_size
  type             = var.ebs_volume_type
  iops             = var.ebs_iops

  tags = {
    Name = "EBS Volume"
  }
}

output "ebs_volume_id" {
  description = "ID do volume EBS criado"
  value       = aws_ebs_volume.ebs_volume.id
}
