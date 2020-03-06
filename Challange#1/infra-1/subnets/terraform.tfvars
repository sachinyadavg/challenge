terragrunt = {
  terraform {
      source = "../../modules/subnets"
       
         }
      include = {
                 path = "${find_in_parent_folders()}"
                 }
        dependencies = {
        paths = [
                "../vpc"
                 ]
    }
    }



###################
# Module Parameters
###################

vpc_id_key = "infra-1/vpc/terraform.tfstate"
subnet_count = "3"
subnet_cidr_blocks = ["172.29.10.0/26","172.29.10.64/26","172.29.10.128/26"] # set these to the subnet range taken from your VPC range
azs = ["eu-west-1a","eu-west-1b","eu-west-1c"] #Availablity Zones according to Region