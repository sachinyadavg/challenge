terragrunt = {
  terraform {
      source = "../../modules/elb"
       
         }
      include = {
                 path = "${find_in_parent_folders()}"
                 }
        dependencies = {
        paths = [
                "../web-tier"
                 ]
    }
    }

#------------------------------
#Module parameters
#------------------------------
subnetids_key = "infra-1/subnets/terraform.tfstate"
ec2_instances_key = "infra-1/web-tier/terraform.tfstate"
