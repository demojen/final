provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "mybucket-him-sep6"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}