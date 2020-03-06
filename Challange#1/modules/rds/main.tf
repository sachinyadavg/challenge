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
resource "aws_db_subnet_group" "default" {
  name       = "mydbsubnetgroup"
  subnet_ids = ["${data.terraform_remote_state.subnets.subnet_id}"]
}


resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "test-user"
  password             = "test123"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.default.name}"
}