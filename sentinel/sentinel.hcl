policy "ec2" {
  source = "./sentinel-policies/ec2-instance-policy.sentinel"
  enforcement_level = "hard-mandatory" #can also be advisory and soft-mandatory
#  params = {
#    "name" = "Sample"
#  }
}
test {
  rules = {
    main = true
#    days = []
  }
}
