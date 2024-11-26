resource "aws_instance" "my-vm" {
  ami = "ami-0e4e6b215628e09df"
  instance_type = "t2.micro"
  tags = {
    Name = "yourname-vm"
  }
  key_name = "yourkey"
  provisioner "chef" {
    node_name = "yourname"
    server_url = "yourserverurl"
    run_list = []
    user_key = file("yourchefserverkey")
    user_name = "yourchefserverusername"
    skip_install = true
    recreate_client = true
    client_options = ["chef_license 'accept'"]
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("yourawskey.pem")
      host = aws_instance.my-vm.public_ip
    }
  }

}

