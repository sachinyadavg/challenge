provider "aws" {
region = "${var.aws_region}"
}
terraform {
  backend "s3" {}
}

#-------------------------------------
#      Configuration
#------------------------------------
data "terraform_remote_state" "elb_instances" {
   backend = "s3"
   config = {
      bucket = "${var.tfstate_bucket}"
      region = "${var.aws_region}"
      key = "${var.ec2_instances_key}"
   }
}

data "terraform_remote_state" "subnet_ids" {
   backend = "s3"
   config = {
      bucket = "${var.tfstate_bucket}"
      region = "${var.aws_region}"
      key = "${var.subnetids_key}"
   }
}


resource "aws_elb" "web_elb" {
  name               = "web-tier-elb"
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
            }

#  listener {
#    instance_port      = 80
#    instance_protocol  = "http"
#    lb_port            = 443
#    lb_protocol        = "https"
#    ssl_certificate_id = "${var.CertArn}"
#           }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
               }
  subnets               = ["${data.terraform_remote_state.subnet_ids.subnet_id}"]
  instances             = ["${data.terraform_remote_state.elb_instances.instance_id}" ]
  cross_zone_load_balancing   = true
}