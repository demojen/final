provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "example" {
  ami           = "ami-0166fe664262f664c" # Example Amazon Linux AMI
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  
}


variable "instance_type" {
  default = "t2.micro"
}

variable "availability_zone" {
  default = "us-east-1a"
}



resource "aws_security_group" "web" {
  name        = "web"
  description = "Web server security group"

  tags = {
    Name  = "Web"
    Owner = "web-team"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web.id

  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
}

