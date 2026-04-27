terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.91.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-098e39bafa7e7303d"
  instance_type = "t3.micro"
}