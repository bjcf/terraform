# ec2_module/main.tf

variable "ami" {
  description = "ID da AMI (Amazon Machine Image)"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "MinhaEC2Instance"
  }
}

