provider "aws" {

  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_vpc" "terra_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    name : "terra-vpc"
  }
}
resource "aws_subnet" "terra_subnet" {
  vpc_id            = aws_vpc.terra_vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
    name : "terra_sub"
  }

}
data "aws_vpc" "exiting_vpc" { ## to get subnet from existing vpc
  default = true
}
resource "aws_subnet" "sub" { ## to get subnet from existing vpc
  vpc_id            = data.aws_vpc.exiting_vpc.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1a"

}
variable "vpc_cidr_block" {
  description = "value of vpc cidr block"

}
variable "access_key" {

}
variable "secret_key" {

}