# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "igw-01955931db361a58e"
resource "aws_internet_gateway" "ig1" {
  tags = {
    Name = "test-ig"
  }
  tags_all = {
    Name = "test-ig"
  }
  vpc_id = "vpc-0d0bb68ed91a6c906"
}

# __generated__ by Terraform
resource "aws_subnet" "sub1" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "us-east-1a"
  # availability_zone_id                           = "use1-az1"
  cidr_block                                     = "10.0.1.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  # enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  # map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    Name = "test1sub"
  }
  tags_all = {
    Name = "test1sub"
  }
  vpc_id = "vpc-0d0bb68ed91a6c906"
}

# __generated__ by Terraform
resource "aws_vpc" "test-vpc" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv4_ipam_pool_id                    = null
  ipv4_netmask_length                  = null
  ipv6_cidr_block                      = null
  ipv6_cidr_block_network_border_group = null
  ipv6_ipam_pool_id                    = null
  # ipv6_netmask_length                  = 0
  tags = {
    Name = "test1"
  }
  tags_all = {
    Name = "test1"
  }
}

# __generated__ by Terraform
resource "aws_instance" "ins1" {
  ami                                  = "ami-0166fe664262f664c"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  get_password_data                    = false
  hibernation                          = false
  host_id                              = null
  host_resource_group_arn              = null
  iam_instance_profile                 = null
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  # ipv6_address_count                   = 0
  # ipv6_addresses                       = []
  key_name                             = "jan24"
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = 0
  private_ip                           = "172.31.82.30"
  secondary_private_ips                = []
  security_groups                      = ["default"]
  source_dest_check                    = true
  subnet_id                            = "subnet-06c09bc305ba08f61"
  tags = {
    Name = "test1"
  }
  tags_all = {
    Name = "test1"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0d670a2c2c46dfcf8"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    amd_sev_snp      = null
    core_count       = 1
    threads_per_core = 1
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 100
    kms_key_id            = null
    tags                  = {}
    tags_all              = {}
    throughput            = 0
    volume_size           = 8
    volume_type           = "gp2"
  }
}
