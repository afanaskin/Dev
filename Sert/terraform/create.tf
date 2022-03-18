terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "build" {
  ami = "ami-092cce4a19b438926"
  instance_type = "t3.micro"
  key_name = "aws_key.pem"
  vpc_security_group_ids = ["sg-014aa96269c6d3b0d"]
}

resource "aws_instance" "run" {
  ami = "ami-092cce4a19b438926"
  instance_type = "t3.micro"
  key_name = "aws_key.pem"
  vpc_security_group_ids = ["sg-014aa96269c6d3b0d"]
}