provider "aws" {
region = "${var.aws_region}"
}

terraform {
  backend "s3" {}
}
######################################################
# Config
##############################################


resource "aws_vpc" "main" {
    cidr_block = "${var.vpc_cidr}"
}