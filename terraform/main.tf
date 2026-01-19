terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

## define provide to manage service on

provider "aws" {
  region = var.region
}

## query cloud provider for available resource.

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

## resource declaration

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

module "s3_bucket" {
  source        = "./modules/s3"
  bucket_name   = "terraform-test-s3-bucket"
  environment   = "dev"
  force_destroy = true
}
