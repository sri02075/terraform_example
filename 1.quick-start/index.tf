terraform {
  required_providers {
    dotenv = {
      source  = "jrhouston/dotenv"
      version = "~> 1.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

data "dotenv" "config" {
  filename = ".env"
}

provider "aws" {
  region     = "ap-northeast-2"
  access_key = data.dotenv.config.env.AWS_ACCESS_KEY_ID
  secret_key = data.dotenv.config.env.AWS_SECRET_ACCESS_KEY
}

resource "aws_instance" "example" {
  ami           = "ami-035233c9da2fabf52"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
