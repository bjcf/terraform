# ebs_module/variables.tf

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
