terragrunt = {
  terraform {
      source = "../../modules/vpc"
       
         }
      include = {
                 path = "${find_in_parent_folders()}"
                 }
        dependencies = {
        paths = [
            
                 ]
    }
    }

###################
# Module Parameters
###################

vpc_cidr = "172.29.10.0/24"