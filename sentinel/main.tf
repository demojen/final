resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Example Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0166fe664262f664c"
  instance_type = "t2.micro"
  key_name      = "jan24"
  security_groups = [aws_security_group.example.name]
  tags = {
    Name = "ExampleInstance"
  }
}
