resource "aws_key_pair" "example" {
  key_name   = "en1"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_instance" "puppet_instance" {
    ami           = "ami-0166fe664262f664c" # Amazon Linux 2 AMI ID for us-east-1
    instance_type = "t2.micro"
    key_name      = aws_key_pair.example.key_name # Replace with your key pair name

    # Security group to allow SSH and HTTP
#    vpc_security_group_ids = [aws_security_group.puppet_sg.id]

    # Assign a public IP
    associate_public_ip_address = true

    # User data script to ensure instance is accessible

    tags = {
      Name = "Puppet-Standalone-Instance"
    }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa") # Path to your private key
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "./puppet.conf"
    destination = "/tmp/puppet.conf"
  }

  provisioner "file" {
    source      = "./site.pp"
    destination = "/tmp/site.pp"
  }

    provisioner "remote-exec" {
      inline = [
        "sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-7.noarch.rpm",
        "sudo yum install -y puppet-agent",
        "sudo mkdir -p /etc/puppetlabs/code/environments/production/manifests",
        "sudo mkdir -p /etc/puppetlabs/code/environments/production/modules",
        "sudo mv /tmp/puppet.conf /etc/puppetlabs/puppet/puppet.conf",
        "sudo mv /tmp/site.pp /etc/puppetlabs/code/environments/production/manifests/site.pp",
        "sudo /opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp"
    ]
  }

}
output "ip" {
  value = aws_instance.puppet_instance.public_ip
}


