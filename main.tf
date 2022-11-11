
provider "aws" {
    region = "us-east-1"
}

variable "image" {
  type = string
  default = "ami-09d3b3274b6c5d4aa"
  description = "Enter your APP Image to be deployed"
}

variable "hw" {
  type = string
  default = "t2.nano"
  description = "Enter your hardware model"
}

variable "name" {
  type = string
  default = "praveen-devops-server1"
  description = "Enter your server name"
}


resource "aws_instance" "myawsserver" {
  ami = var.image
  instance_type = var.hw

  tags = {
    Name = var.name
    Env = "dev"
    Owner = "praveen"
  }
}




output "myawsserver-ip" {
  value = aws_instance.myawsserver.public_ip
}

output "myserver-PrivateIP" {
  value = aws_instance.myawsserver.private_ip
}
