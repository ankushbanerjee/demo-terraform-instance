terraform {
  backend "remote" {
    organization = "ACG-Terrafom-Demos"
    workspaces {
      name = "Example-Workspace"
    }
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "ankushmac"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
