provider "aws" {
region = "${var.aws_region}"
}

terraform {
  backend "s3" {}
}
data "terraform_remote_state" "subnets" {
  backend = "s3"
  config {
    bucket = "${var.tfstate_bucket}"
    region = "${var.aws_region}"
    key = "${var.subnetids_tfstate_key}"
  }

}

resource "aws_instance" "default" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  count = "${length(data.terraform_remote_state.subnets.subnet_id)}"
  key_name = "${var.ssh_key_name}"
  subnet_id = "${element(data.terraform_remote_state.subnets.subnet_id,count.index)}"
  root_block_device = {
    volume_type = "gp2"
    volume_size = "${var.root_volume_size}"
                      } 
                                  }