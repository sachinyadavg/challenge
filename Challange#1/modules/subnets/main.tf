

provider "aws" {
region = "${var.aws_region}"
}
terraform {
  backend "s3" {}
}
#####################################################################
#          CONFIGURATION                                            #
#####################################################################
data "terraform_remote_state" "vpc" {
   backend = "s3"
   config = {
      bucket = "${var.tfstate_bucket}"
      region = "${var.aws_region}"
      key = "${var.vpc_id_key}"
   }
}

resource "aws_subnet" "main" {
   vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
   cidr_block = "${element(var.subnet_cidr_blocks,count.index)}" 
   count = "${var.subnet_count}"
   availability_zone = "${element(var.azs, count.index)}"
}