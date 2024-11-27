
resource "aws_instance" "example" {
  ami           = "ami-0166fe664262f664c" # Example Amazon Linux AMI
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  tags = {
    Name = "github-1"
  }
  
}
