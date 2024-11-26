module "vpc" {
    source = "git::https://github.com/rathihimanshu/nov1?ref=v1.0.0"
    cidr_block = "10.0.0.0/16"
  
}