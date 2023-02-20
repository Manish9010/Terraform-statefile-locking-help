provider "aws" {
    region                   = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                  = "Terraform1"
}

terraform {
  backend "s3" {
    bucket = "my-aws-bucket-storage-tfs"
    key = "path/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "locking-table-helper"
    shared_credentials_file = "~/.aws/credentials"
    profile                  = "Terraform1"
  }
}


resource "aws_instance" "myinstance" {
    ami = "ami-002070d43b0a4f171"
    instance_type = "t2.micro"
    count=5
}

