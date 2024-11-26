resource "aws_instance" "my-vm" {
  ami = "ami-0166fe664262f664c"
  instance_type = "t2.micro"
  tags = {
    Name = "chef-vm"
  }
  key_name = aws_key_pair.example.key_name
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y curl",
      "curl -L https://omnitruck.chef.io/install.sh | sudo bash",
      "echo '172.31.35.163 chefserver' | sudo tee -a /etc/hosts"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
  provisioner "local-exec" {
    command = "knife ssl fetch --server-url https://chefserver/organizations/orgone"
  }
  provisioner "local-exec" {
    command = "knife bootstrap ${self.public_ip} --sudo  --connection-user ec2-user --ssh-identity-file ~/.ssh/id_rsa --node-name chefnode1 --run-list '' --user admin --key /root/aws/admin.pem --server-url https://chefserver/organizations/orgone --yes"
  }

}
