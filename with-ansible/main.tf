resource "aws_key_pair" "example" {
  key_name   = "e1"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "example" {
  key_name      = aws_key_pair.example.key_name
  ami           = "ami-0166fe664262f664c"
  instance_type = "t2.micro"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
#  provisioner "remote-exec" {
#    inline = [
#      "sudo yum update -y",
#      "sudo yum install -y python3",
#      "sudo ln -s /usr/bin/python3 /usr/bin/python || true"
#    ]
#  }


#  provisioner "local-exec" {
#    command = "echo ${self.public_ip} ansible_ssh_user=ec2-user ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_python_interpreter=/usr/bin/python3 > hosts"
#  }
#  provisioner "local-exec" {
#    command = "ansible-playbook -i hosts abc.yml"
#  }
#  provisioner "local-exec" {
#    command = "ansible -i hosts ${self.public_ip} -b -u ec2-user --private-key ~/.ssh/id_rsa -m user -a 'name=demouser state=present uid=1011'"
#  }
#
}
output "ip" {
  value = aws_instance.example.public_ip
}


