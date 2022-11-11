provider "aws" {
 region = "us-east-2"
}

variable "image" {
  type = string
  default = "ami-0603cbe34fd08cb81"
  description = "Enter your APP Image to be deployed"
}

variable "hw" {
  type = string
  default = "t2.nano"
  description = "Enter your hardware model"
}

variable "name" {
  type = string
  default = "kailash11-server1"
  description = "Enter your server name"
}

resource "aws_instance" "kailashmyawsserver" {
  ami = var.image
  instance_type = var.hw

  tags = {
    Name = var.name
    Env = "test"
    Owner = "kailash11"
  }
}

output "kailashmyawsserver-ip" {
  value = aws_instance.kailashmyawsserver.public_ip
}

output "kailashmyawsserver-pip" {
  value = aws_instance.kailashmyawsserver.private_ip
}

output "kailashmyawsserver-ipv6" {
  value = aws_instance.kailashmyawsserver.instance_type
}
